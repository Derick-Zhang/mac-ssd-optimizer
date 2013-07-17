all: TRIM SMS noatime reboot 

checkroot:
	@echo -n checking privilege...
	@touch / &>/dev/null || ( echo error!;exit 1; )
	@echo ok!


SMS: checkroot
	@echo -n disabling Sudden Motion Sensor...
	@pmset -a sms 0 || ( echo error!;exit 1; )
	@echo done!

TRIM: checkroot
	@echo -n enabling TRIM...
	@cp /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage.bak
	@perl -pi -e 's|(\x52\x6F\x74\x61\x74\x69\x6F\x6E\x61\x6C\x00).{9}(\x00\x54)|$1\x00\x00\x00\x00\x00\x00\x00\x00\x00$2|sg' /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage
	- @kextcache -system-prelinked-kernel &>/dev/null
	@kextcache -system-caches
	@echo done

noatime: checkroot
	@echo -n disabling atime...
	@echo '<?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> <plist version="1.0"> <dict> <key>Label</key> <string>com.noatime.root</string> <key>ProgramArguments</key> <array> <string>mount</string> <string>-uwo</string> <string>noatime</string> <string>/</string> </array> <key>RunAtLoad</key> <true/> </dict> </plist>' > /Library/LaunchDaemons/com.noatime.root.plist || ( echo error!;exit 1; )
	@echo done!

reboot: checkroot
	@echo Finished !
	@echo CAUTION: we are going to reboot, press Ctrl-C to abort and you can reboot manually later.;sleep 5;
	@for i in `seq 10 1`; do clear; echo CAUTION: we are going to reboot in $$i seconds;sleep 1; done;
	@reboot
