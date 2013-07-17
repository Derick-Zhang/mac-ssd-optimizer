mac-ssd-optimizer
=================

An optimizer for mac with SSD installed by your self / 可优化mac上自行安装的SSD设备


[English]

 - What is this?

If you have a mac with HDD, and now you want to upgrade to SSD, you need this tool.


 - What exactly does it do?

This tool will perform several tasks, listed below：

1. enable TRIM(*), which will speed up your SSD and extend it's life.
2. disable atime, whose effect is similar to the 1st item.
3. disable SMS, which is useless for SSD.
4. reboot automatically.
 

- How to use?

After the SSD and OSX being installed, follow the below steps:

1. download this tool to your mac, you can place it in any directory.
2. run the script: sudo make -f ssd_opt.makefile
3. waiting for executing and reboot.
4. check result.


 - Caution:

1. This tool will report "segment fault", it okay, just ignore.
2. TRIM-tuning sometimes does not work, you should check it as this article say: http://www.cnbeta.com/articles/219752.htm (chinese)


[简体中文]

Macbook装完SSD后，需要进一步优化，以充分释放性能并提高寿命。

附件是优化程序，执行方式为：sudo make -f ssd_opt.makefile

执行优化包括：
- 打开TRIM
-	禁用atime
-	禁用磁盘保护

注意：
1、	打开TRIM时，会误报segment fault，忽略即可
2、	由于系统版本原因，TRIM可能打开失败，如何检测成功与否，以及失败了怎么办，请参见：http://www.cnbeta.com/articles/219752.htm
