mac-ssd-optimizer
=================

An optimizer for mac with SSD installed by your self / 可优化mac上自行安装的SSD设备


[English]

What is this?

 - If you have a mac with HDD, and now you want to upgrade to SSD, you need this tool.


What exactly does it do?

This tool will perform several tasks, listed below：

 - enable TRIM(*), which will speed up your SSD's writes and extend it's life.
 - disable atime, which will speed up your SSD's reads and extend it's life.
 - disable SMS, which is useless for SSD.
 - reboot automatically.
 

How to use?

After the SSD and OSX being installed, follow the steps below:

 - download this tool to your mac, you can place it in any directory.
 - run the script: sudo make -f ssd_opt.makefile
 - waiting for executing and reboot.
 - check result.


Caution:

 - This tool will report "segment fault", but it's OK, just ignore.
 - (*)TRIM-tuning sometimes does not work, you should check it as what this article says: http://www.cnbeta.com/articles/219752.htm (chinese)


[简体中文]

Macbook装完SSD后，需要进一步优化，以充分释放性能并提高寿命。

执行方式为：sudo make -f ssd_opt.makefile

优化点包括：
- 打开TRIM，可提升写性能并增加寿命。
-	禁用atime，可提升读性能并增加寿命。
-	禁用磁盘保护，这个对SSD没有意义，白费电。

注意：
 - 打开TRIM时，会误报segment fault，忽略即可。
 - 由于系统版本原因，TRIM可能打开失败，如何检测成功与否，以及失败了怎么办，请参见：http://www.cnbeta.com/articles/219752.htm
