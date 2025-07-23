- [Surelog 一键安装脚本](#surelog-------)
  * [什么是 Surelog？](#----surelog-)
  * [典型应用](#----)
  * [支持项目与验证成果](#---------)
  * [脚本功能概览](#------)
  * [快速使用](#----)
  * [示例命令](#----)
  * [鸣谢](#--)
- [附录1：安装过程](#--1-----)
- [附录2:安装日志](#--2-----)
 # Surelog 一键安装脚本
 
 本项目提供一个 一键式安装脚本 install_surelog.sh，用于快速部署 Surelog —— 一个强大且现代化的 SystemVerilog 2017 前端工具链，支持从预处理、解析、到建模输出（UHDM），广泛应用于综合、仿真、形式验证等EDA场景中。

## 什么是 Surelog？
Surelog 是一款开源的 SystemVerilog 前端工具，具备如下功能：

- SystemVerilog 2017 标准支持

- 预处理器 + 语法解析器 + 消解器（Elaborator）

- 输出 UHDM 二进制格式，可供 Yosys、Verilator、VCS 等工具链使用

- 提供 C/C++ VPI 接口 与 Python AST API，便于二次开发

- 支持多线程解析、大型模块拆分、增量编译（基于 Cap’n Proto）

## 典型应用
- 静态检查工具（Linter）

- 硬件仿真器（Simulator）

- 合成器（Synthesis）

- 形式验证工具（Formal）

- 流水线自动化 EDA 编译流程（作为前端）

## 支持项目与验证成果
- BlackParrot、Ariane 等 RISC-V 项目解析结果与 Verilator 保持一致

- Ibex 与 Earlgrey 项目已基于 Surelog + UHDM + Yosys 成功完成综合并部署于实际硬件

## 脚本功能概览
本脚本将自动完成以下 8 步全自动安装流程：

- 代理配置（Git + Shell 环境变量）

- 系统依赖安装（编译工具链、JDK、Zlib 等）

- Python 包安装（如 orderedmultidict）

- 安装 CMake 3.27.9 到 /opt/cmake

- 克隆 Surelog 仓库及 UHDM 子模块

- 使用 CMake 配置构建

- 多线程编译 Surelog

- 安装完成验证（显示 Surelog 版本信息）

## 快速使用
```
chmod +x install_surelog.sh
./install_surelog.sh
```

过程中你需要输入你的物理机代理地址（如 127.0.0.1:7890），以顺利访问 GitHub 和下载依赖。

## 示例命令
```
cd Surelog
./build/bin/surelog -parse -sverilog AES.v
```

成功解析后将生成：

- surelog.uhdm：二进制格式的 UHDM 数据库

- surelog.log：日志信息

- file.lst：源文件路径列表

你可用 uhdm-dump 查看语法树：
```
./build/third_party/UHDM/bin/uhdm-dump slpp_all/surelog.uhdm > uhdm_tree.txt
```

## 鸣谢
本脚本致力于降低 Surelog 在中国大陆或实验环境中的部署难度。感谢[chipsalliance/Surelog](https://github.com/chipsalliance/Surelog/) 的开源贡献，使得硬件设计工具生态不断向前发展。

# 附录1：安装过程

![](https://files.mdnice.com/user/108782/f81f3205-9c94-45a9-a030-55cbab5592ab.png)


![](https://files.mdnice.com/user/108782/0ad676e6-42a3-4f4a-9da8-70a4190712b3.png)



![](https://files.mdnice.com/user/108782/8fda6f9b-2790-4788-a68d-3ba62f58bc7e.jpg)



![](https://files.mdnice.com/user/108782/12b5dfc2-bca6-4c82-9bd5-deea048d6217.jpg)


![](https://files.mdnice.com/user/108782/93db2397-f9f3-4148-b98b-6c2d2ab4a3bd.jpg)


![](https://files.mdnice.com/user/108782/6378ab8b-358f-4440-bb33-2b6f3953a691.jpg)


![](https://files.mdnice.com/user/108782/51217b45-7847-4496-bd00-d3d61e0dbff7.jpg)


![](https://files.mdnice.com/user/108782/497491a7-7896-49ba-b8b4-264eaf848a3a.jpg)

# 附录2:安装日志

```
 ssh hx@10.211.55.65
hx@10.211.55.65's password: 
Welcome to Ubuntu 20.04.5 LTS (GNU/Linux 5.4.0-131-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue 22 Jul 2025 09:17:28 AM UTC

  System load:              0.14
  Usage of /:               0.6% of 1.97TB
  Memory usage:             4%
  Swap usage:               0%
  Processes:                195
  Users logged in:          0
  IPv4 address for docker0: 172.17.0.1
  IPv4 address for enp0s5:  10.211.55.65
  IPv6 address for enp0s5:  


12 updates can be applied immediately.
To see these additional updates run: apt list --upgradable


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Sun Oct 23 03:48:54 2022 from 10.211.55.2
(base) hx@orz:~$ ls
Miniconda3-py38_4.12.0-Linux-x86_64.sh  miniconda3
(base) hx@orz:~$ sudo vim install_surelog.sh
[sudo] password for hx: 
(base) hx@orz:~$ sudo chmod +x install_surelog.sh 
(base) hx@orz:~$ ls
Miniconda3-py38_4.12.0-Linux-x86_64.sh  install_surelog.sh  miniconda3
(base) hx@orz:~$ ./install_surelog.sh 
====================================================
🛠️  Surelog 一键安装脚本（共 8 步）
🚀  开始安装，请确保联网，并具有 sudo 权限
🌐 本脚本将配置 Git 和终端代理（HTTP + SOCKS5）
====================================================
🌐 [1/8] 配置 Git 和 Shell 全局代理
请输入代理 IP（例如 192.168.1.218）: 192.168.1.33
请输入代理端口（例如 7890）: 7890
🔧 配置 Git 全局代理...
🔧 配置当前终端环境变量代理...
🌐 正在测试代理是否生效...
🔍 使用 curl 获取 IP 地址（来自 ipinfo.io）：
{
  "ip": "",
  "hostname": "",
  "city": "Incheon",
  "region": "Incheon",
  "country": "KR",
  "loc": "",
  "org": "",
  "postal": "",
  "timezone": "Asia/Seoul",
  "readme": "https://ipinfo.io/missingauth"
}
🔍 当前 Git 代理配置如下：
  http.proxy   = http://192.168.1.33:7890
  https.proxy  = http://192.168.1.33:7890
  sock.proxy   = socks5://192.168.1.33:7890

✅ 如果上述代理配置和 IP 信息正确，输入 y 继续安装，其他键退出: y
🔧 [2/8] 安装系统依赖...
Hit:1 https://mirrors.ustc.edu.cn/ubuntu focal InRelease
Get:2 https://mirrors.ustc.edu.cn/ubuntu focal-updates InRelease [128 kB]
Get:3 https://mirrors.ustc.edu.cn/ubuntu focal-backports InRelease [128 kB]
Get:4 https://mirrors.ustc.edu.cn/ubuntu focal-security InRelease [128 kB]
Get:5 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 Packages [3954 kB]
Get:6 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main Translation-en [601 kB]
Get:7 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 c-n-f Metadata [18.0 kB]
Get:8 https://mirrors.ustc.edu.cn/ubuntu focal-updates/restricted amd64 Packages [3922 kB]
Get:9 https://mirrors.ustc.edu.cn/ubuntu focal-updates/restricted Translation-en [548 kB]
Get:10 https://mirrors.ustc.edu.cn/ubuntu focal-updates/restricted amd64 c-n-f Metadata [604 B]
Get:11 https://mirrors.ustc.edu.cn/ubuntu focal-updates/universe amd64 Packages [1262 kB]
Get:12 https://mirrors.ustc.edu.cn/ubuntu focal-updates/universe Translation-en [303 kB]
Get:13 https://mirrors.ustc.edu.cn/ubuntu focal-updates/universe amd64 c-n-f Metadata [29.3 kB]
Get:14 https://mirrors.ustc.edu.cn/ubuntu focal-updates/multiverse amd64 Packages [29.7 kB]
Get:15 https://mirrors.ustc.edu.cn/ubuntu focal-updates/multiverse Translation-en [8316 B]
Get:16 https://mirrors.ustc.edu.cn/ubuntu focal-updates/multiverse amd64 c-n-f Metadata [688 B]
Get:17 https://mirrors.ustc.edu.cn/ubuntu focal-backports/main amd64 Packages [45.7 kB]
Get:18 https://mirrors.ustc.edu.cn/ubuntu focal-backports/main amd64 c-n-f Metadata [1420 B]
Get:19 https://mirrors.ustc.edu.cn/ubuntu focal-backports/universe amd64 Packages [25.0 kB]
Get:20 https://mirrors.ustc.edu.cn/ubuntu focal-backports/universe Translation-en [16.3 kB]
Get:21 https://mirrors.ustc.edu.cn/ubuntu focal-backports/universe amd64 c-n-f Metadata [880 B]
Get:22 https://mirrors.ustc.edu.cn/ubuntu focal-security/main amd64 Packages [3564 kB]
Get:23 https://mirrors.ustc.edu.cn/ubuntu focal-security/main Translation-en [518 kB]
Get:24 https://mirrors.ustc.edu.cn/ubuntu focal-security/main amd64 c-n-f Metadata [14.4 kB]
Get:25 https://mirrors.ustc.edu.cn/ubuntu focal-security/restricted amd64 Packages [3768 kB]
Get:26 https://mirrors.ustc.edu.cn/ubuntu focal-security/restricted Translation-en [527 kB]
Get:27 https://mirrors.ustc.edu.cn/ubuntu focal-security/restricted amd64 c-n-f Metadata [584 B]
Get:28 https://mirrors.ustc.edu.cn/ubuntu focal-security/universe amd64 Packages [1040 kB]
Get:29 https://mirrors.ustc.edu.cn/ubuntu focal-security/universe Translation-en [221 kB]
Get:30 https://mirrors.ustc.edu.cn/ubuntu focal-security/universe amd64 c-n-f Metadata [22.4 kB]
Get:31 https://mirrors.ustc.edu.cn/ubuntu focal-security/multiverse amd64 Packages [26.6 kB]
Get:32 https://mirrors.ustc.edu.cn/ubuntu focal-security/multiverse Translation-en [6448 B]
Get:33 https://mirrors.ustc.edu.cn/ubuntu focal-security/multiverse amd64 c-n-f Metadata [604 B]
Fetched 20.9 MB in 3s (6370 kB/s)                              
Reading package lists... Done
Building dependency tree       
Reading state information... Done
270 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree       
Reading state information... Done
build-essential is already the newest version (12.8ubuntu1.1).
build-essential set to manually installed.
zlib1g-dev is already the newest version (1:1.2.11.dfsg-2ubuntu1.5).
zlib1g-dev set to manually installed.
The following additional packages will be installed:
  at-spi2-core ca-certificates-java fontconfig-config fonts-dejavu-core
  fonts-dejavu-extra java-common libatk-bridge2.0-0 libatk-wrapper-java
  libatk-wrapper-java-jni libatk1.0-0 libatk1.0-data libatspi2.0-0
  libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libcurl4
  libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libfontconfig1
  libfontenc1 libgif7 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd0
  libglx-mesa0 libglx0 libgoogle-perftools4 libgraphite2-3 libharfbuzz0b
  libice-dev libice6 libjemalloc2 libjpeg-turbo8 libjpeg8 liblcms2-2 libllvm12
  liblzma-dev libpciaccess0 libpcsclite1 libpthread-stubs0-dev
  libsensors-config libsensors5 libsm-dev libsm6 libtcmalloc-minimal4
  libunwind-dev libunwind8 libvulkan1 libwayland-client0 libx11-6 libx11-dev
  libx11-xcb1 libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0
  libxcb-present0 libxcb-randr0 libxcb-shape0 libxcb-shm0 libxcb-sync1
  libxcb-xfixes0 libxcb1-dev libxcomposite1 libxdmcp-dev libxfixes3 libxft2
  libxi6 libxinerama1 libxkbfile1 libxmu6 libxpm4 libxrandr2 libxrender1
  libxshmfence1 libxt-dev libxt6 libxtst6 libxv1 libxxf86dga1 libxxf86vm1
  mesa-vulkan-drivers openjdk-11-jdk-headless openjdk-11-jre
  openjdk-11-jre-headless python-pip-whl x11-common x11-utils
  x11proto-core-dev x11proto-dev xorg-sgml-doctools xtrans-dev
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk
  gitweb git-cvs git-mediawiki git-svn default-jre cups-common libice-doc
  liblcms2-utils liblzma-doc pcscd lm-sensors libsm-doc libx11-doc libxcb-doc
  libxt-doc openjdk-11-demo openjdk-11-source visualvm libnss-mdns
  fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei
  | fonts-wqy-zenhei fonts-indic mesa-utils
The following NEW packages will be installed:
  at-spi2-core ca-certificates-java fontconfig-config fonts-dejavu-core
  fonts-dejavu-extra java-common libatk-bridge2.0-0 libatk-wrapper-java
  libatk-wrapper-java-jni libatk1.0-0 libatk1.0-data libatspi2.0-0
  libavahi-client3 libavahi-common-data libavahi-common3 libcups2
  libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libfontconfig1
  libfontenc1 libgif7 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd0
  libglx-mesa0 libglx0 libgoogle-perftools-dev libgoogle-perftools4
  libgraphite2-3 libharfbuzz0b libice-dev libice6 libjemalloc-dev libjemalloc2
  libjpeg-turbo8 libjpeg8 liblcms2-2 libllvm12 liblzma-dev libpciaccess0
  libpcsclite1 libpthread-stubs0-dev libsensors-config libsensors5 libsm-dev
  libsm6 libtcmalloc-minimal4 libunwind-dev libvulkan1 libwayland-client0
  libx11-dev libx11-xcb1 libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri3-0
  libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-shape0 libxcb-shm0
  libxcb-sync1 libxcb-xfixes0 libxcb1-dev libxcomposite1 libxdmcp-dev
  libxfixes3 libxft2 libxi6 libxinerama1 libxkbfile1 libxmu6 libxpm4
  libxrandr2 libxrender1 libxshmfence1 libxt-dev libxt6 libxtst6 libxv1
  libxxf86dga1 libxxf86vm1 mesa-vulkan-drivers openjdk-11-jdk
  openjdk-11-jdk-headless openjdk-11-jre openjdk-11-jre-headless x11-common
  x11-utils x11proto-core-dev x11proto-dev xorg-sgml-doctools xtrans-dev
The following packages will be upgraded:
  curl git libcurl4 libunwind8 libx11-6 python-pip-whl python3-pip
7 upgraded, 96 newly installed, 0 to remove and 263 not upgraded.
Need to get 169 MB of archives.
After this operation, 826 MB of additional disk space will be used.
Get:1 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libx11-6 amd64 2:1.6.9-2ubuntu1.6 [577 kB]
Get:2 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libatspi2.0-0 amd64 2.36.0-2 [64.2 kB]
Get:3 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 x11-common all 1:7.7+19ubuntu14 [22.3 kB]
Get:4 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxtst6 amd64 2:1.2.3-1 [12.8 kB]
Get:5 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 at-spi2-core amd64 2.36.0-2 [48.7 kB]
Get:6 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 java-common all 0.72 [6816 B]
Get:7 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libavahi-common-data amd64 0.7-4ubuntu7.3 [21.4 kB]
Get:8 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libavahi-common3 amd64 0.7-4ubuntu7.3 [21.9 kB]
Get:9 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libavahi-client3 amd64 0.7-4ubuntu7.3 [25.5 kB]
Get:10 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libcups2 amd64 2.3.1-9ubuntu1.9 [234 kB]
Get:11 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 fonts-dejavu-core all 2.37-1 [1041 kB]
Get:12 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 fontconfig-config all 2.13.1-2ubuntu3 [28.8 kB]
Get:13 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libfontconfig1 amd64 2.13.1-2ubuntu3 [114 kB]
Get:14 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 liblcms2-2 amd64 2.9-4 [140 kB]
Get:15 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libjpeg-turbo8 amd64 2.0.3-0ubuntu1.20.04.3 [118 kB]
Get:16 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2194 B]
Get:17 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libgraphite2-3 amd64 1.3.13-11build1 [73.5 kB]
Get:18 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libharfbuzz0b amd64 2.6.4-1ubuntu4.3 [391 kB]
Get:19 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libpcsclite1 amd64 1.8.26-3 [22.0 kB]
Get:20 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 openjdk-11-jre-headless amd64 11.0.27+6~us1-0ubuntu1~20.04 [38.3 MB]
Get:21 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 ca-certificates-java all 20190405ubuntu1.1 [12.4 kB]
Get:22 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 curl amd64 7.68.0-1ubuntu2.25 [162 kB]
Get:23 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libcurl4 amd64 7.68.0-1ubuntu2.25 [235 kB]
Get:24 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 fonts-dejavu-extra all 2.37-1 [1953 kB]
Get:25 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 git amd64 1:2.25.1-1ubuntu3.14 [4613 kB]
Get:26 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libatk1.0-data all 2.35.1-1ubuntu2 [2964 B]
Get:27 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libatk1.0-0 amd64 2.35.1-1ubuntu2 [45.5 kB]
Get:28 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libatk-bridge2.0-0 amd64 2.34.2-0ubuntu2~20.04.1 [58.2 kB]
Get:29 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libfontenc1 amd64 1:1.1.4-0ubuntu1 [14.0 kB]
Get:30 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libglvnd0 amd64 1.3.2-1~ubuntu0.20.04.2 [48.1 kB]
Get:31 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libglapi-mesa amd64 21.2.6-0ubuntu0.1~20.04.2 [27.4 kB]
Get:32 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libx11-xcb1 amd64 2:1.6.9-2ubuntu1.6 [9448 B]
Get:33 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-dri2-0 amd64 1.14-2 [6920 B]
Get:34 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-dri3-0 amd64 1.14-2 [6552 B]
Get:35 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-glx0 amd64 1.14-2 [22.1 kB]
Get:36 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-present0 amd64 1.14-2 [5560 B]
Get:37 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-shm0 amd64 1.14-2 [5584 B]
Get:38 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-sync1 amd64 1.14-2 [8884 B]
Get:39 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-xfixes0 amd64 1.14-2 [9296 B]
Get:40 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxfixes3 amd64 1:5.0.3-2 [10.9 kB]
Get:41 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxshmfence1 amd64 1.3-1 [5028 B]
Get:42 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxxf86vm1 amd64 1:1.1.4-1build1 [10.2 kB]
Get:43 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libdrm-amdgpu1 amd64 2.4.107-8ubuntu1~20.04.2 [18.6 kB]
Get:44 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libpciaccess0 amd64 0.16-0ubuntu1 [17.9 kB]
Get:45 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libdrm-intel1 amd64 2.4.107-8ubuntu1~20.04.2 [60.3 kB]
Get:46 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libdrm-nouveau2 amd64 2.4.107-8ubuntu1~20.04.2 [16.6 kB]
Get:47 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libdrm-radeon1 amd64 2.4.107-8ubuntu1~20.04.2 [19.7 kB]
Get:48 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libllvm12 amd64 1:12.0.0-3ubuntu1~20.04.5 [18.8 MB]
Get:49 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libsensors-config all 1:3.6.0-2ubuntu1.1 [6052 B]
Get:50 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libsensors5 amd64 1:3.6.0-2ubuntu1.1 [27.2 kB]
Get:51 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libvulkan1 amd64 1.2.131.2-1 [93.3 kB]
Get:52 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libgl1-mesa-dri amd64 21.2.6-0ubuntu0.1~20.04.2 [11.0 MB]
Get:53 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libglx-mesa0 amd64 21.2.6-0ubuntu0.1~20.04.2 [137 kB]
Get:54 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libglx0 amd64 1.3.2-1~ubuntu0.20.04.2 [32.5 kB]
Get:55 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libgl1 amd64 1.3.2-1~ubuntu0.20.04.2 [85.8 kB]
Get:56 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libice6 amd64 2:1.0.10-0ubuntu1 [41.0 kB]
Get:57 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libsm6 amd64 2:1.2.3-1 [16.1 kB]
Get:58 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxt6 amd64 1:1.1.5-1 [160 kB]
Get:59 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxmu6 amd64 2:1.1.3-0ubuntu1 [45.8 kB]
Get:60 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libxpm4 amd64 1:3.5.12-1ubuntu0.20.04.2 [34.9 kB]
Get:61 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxaw7 amd64 2:1.0.13-1 [173 kB]
Get:62 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-shape0 amd64 1.14-2 [5928 B]
Get:63 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcomposite1 amd64 1:0.4.5-1 [6976 B]
Get:64 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxrender1 amd64 1:0.9.10-1 [18.7 kB]
Get:65 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxft2 amd64 2.3.3-0ubuntu1 [39.2 kB]
Get:66 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxi6 amd64 2:1.7.10-0ubuntu1 [29.9 kB]
Get:67 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxinerama1 amd64 2:1.1.4-2 [6904 B]
Get:68 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxkbfile1 amd64 1:1.1.0-1 [65.3 kB]
Get:69 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxrandr2 amd64 2:1.5.2-0ubuntu1 [18.5 kB]
Get:70 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxv1 amd64 2:1.0.11-1 [10.7 kB]
Get:71 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxxf86dga1 amd64 2:1.1.5-0ubuntu1 [12.0 kB]
Get:72 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 x11-utils amd64 7.7+5 [199 kB]
Get:73 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libatk-wrapper-java all 0.37.1-1 [53.0 kB]
Get:74 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libatk-wrapper-java-jni amd64 0.37.1-1 [45.1 kB]
Get:75 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libgif7 amd64 5.1.9-1ubuntu0.1 [32.4 kB]
Get:76 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libtcmalloc-minimal4 amd64 2.7-1ubuntu2 [93.0 kB]
Get:77 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libunwind8 amd64 1.2.1-9ubuntu0.1 [47.7 kB]
Get:78 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libgoogle-perftools4 amd64 2.7-1ubuntu2 [195 kB]
Get:79 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 liblzma-dev amd64 5.2.4-1ubuntu1.1 [147 kB]
Get:80 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libunwind-dev amd64 1.2.1-9ubuntu0.1 [472 kB]
Get:81 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libgoogle-perftools-dev amd64 2.7-1ubuntu2 [445 kB]
Get:82 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 xorg-sgml-doctools all 1:1.11-1 [12.9 kB]
Get:83 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 x11proto-dev all 2019.2-1ubuntu1 [594 kB]
Get:84 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 x11proto-core-dev all 2019.2-1ubuntu1 [2620 B]
Get:85 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libice-dev amd64 2:1.0.10-0ubuntu1 [47.8 kB]
Get:86 https://mirrors.ustc.edu.cn/ubuntu focal/universe amd64 libjemalloc2 amd64 5.2.1-1ubuntu1 [235 kB]
Get:87 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libpthread-stubs0-dev amd64 0.4-1 [5384 B]
Get:88 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libsm-dev amd64 2:1.2.3-1 [17.0 kB]
Get:89 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libwayland-client0 amd64 1.18.0-1ubuntu0.1 [23.9 kB]
Get:90 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxau-dev amd64 1:1.0.9-0ubuntu1 [9552 B]
Get:91 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxdmcp-dev amd64 1:1.1.3-0ubuntu1 [25.3 kB]
Get:92 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 xtrans-dev all 1.4.0-1 [68.9 kB]
Get:93 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb1-dev amd64 1.14-2 [80.5 kB]
Get:94 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 libx11-dev amd64 2:1.6.9-2ubuntu1.6 [648 kB]
Get:95 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxcb-randr0 amd64 1.14-2 [16.3 kB]
Get:96 https://mirrors.ustc.edu.cn/ubuntu focal/main amd64 libxt-dev amd64 1:1.1.5-1 [395 kB]
Get:97 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 mesa-vulkan-drivers amd64 21.2.6-0ubuntu0.1~20.04.2 [5788 kB]
Get:98 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 openjdk-11-jre amd64 11.0.27+6~us1-0ubuntu1~20.04 [194 kB]
Get:99 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 openjdk-11-jdk-headless amd64 11.0.27+6~us1-0ubuntu1~20.04 [73.8 MB]
Get:100 https://mirrors.ustc.edu.cn/ubuntu focal-updates/main amd64 openjdk-11-jdk amd64 11.0.27+6~us1-0ubuntu1~20.04 [2876 kB]
Get:101 https://mirrors.ustc.edu.cn/ubuntu focal-updates/universe amd64 python3-pip all 20.0.2-5ubuntu1.11 [231 kB]
Get:102 https://mirrors.ustc.edu.cn/ubuntu focal-updates/universe amd64 python-pip-whl all 20.0.2-5ubuntu1.11 [1808 kB]
Get:103 https://mirrors.ustc.edu.cn/ubuntu focal/universe amd64 libjemalloc-dev amd64 5.2.1-1ubuntu1 [425 kB]
Fetched 169 MB in 10s (16.7 MB/s)                                              
Extracting templates from packages: 100%
(Reading database ... 78800 files and directories currently installed.)
Preparing to unpack .../000-libx11-6_2%3a1.6.9-2ubuntu1.6_amd64.deb ...
Unpacking libx11-6:amd64 (2:1.6.9-2ubuntu1.6) over (2:1.6.9-2ubuntu1.2) ...
Selecting previously unselected package libatspi2.0-0:amd64.
Preparing to unpack .../001-libatspi2.0-0_2.36.0-2_amd64.deb ...
Unpacking libatspi2.0-0:amd64 (2.36.0-2) ...
Selecting previously unselected package x11-common.
Preparing to unpack .../002-x11-common_1%3a7.7+19ubuntu14_all.deb ...
dpkg-query: no packages found matching nux-tools
Unpacking x11-common (1:7.7+19ubuntu14) ...
Selecting previously unselected package libxtst6:amd64.
Preparing to unpack .../003-libxtst6_2%3a1.2.3-1_amd64.deb ...
Unpacking libxtst6:amd64 (2:1.2.3-1) ...
Selecting previously unselected package at-spi2-core.
Preparing to unpack .../004-at-spi2-core_2.36.0-2_amd64.deb ...
Unpacking at-spi2-core (2.36.0-2) ...
Selecting previously unselected package java-common.
Preparing to unpack .../005-java-common_0.72_all.deb ...
Unpacking java-common (0.72) ...
Selecting previously unselected package libavahi-common-data:amd64.
Preparing to unpack .../006-libavahi-common-data_0.7-4ubuntu7.3_amd64.deb ...
Unpacking libavahi-common-data:amd64 (0.7-4ubuntu7.3) ...
Selecting previously unselected package libavahi-common3:amd64.
Preparing to unpack .../007-libavahi-common3_0.7-4ubuntu7.3_amd64.deb ...
Unpacking libavahi-common3:amd64 (0.7-4ubuntu7.3) ...
Selecting previously unselected package libavahi-client3:amd64.
Preparing to unpack .../008-libavahi-client3_0.7-4ubuntu7.3_amd64.deb ...
Unpacking libavahi-client3:amd64 (0.7-4ubuntu7.3) ...
Selecting previously unselected package libcups2:amd64.
Preparing to unpack .../009-libcups2_2.3.1-9ubuntu1.9_amd64.deb ...
Unpacking libcups2:amd64 (2.3.1-9ubuntu1.9) ...
Selecting previously unselected package fonts-dejavu-core.
Preparing to unpack .../010-fonts-dejavu-core_2.37-1_all.deb ...
Unpacking fonts-dejavu-core (2.37-1) ...
Selecting previously unselected package fontconfig-config.
Preparing to unpack .../011-fontconfig-config_2.13.1-2ubuntu3_all.deb ...
Unpacking fontconfig-config (2.13.1-2ubuntu3) ...
Selecting previously unselected package libfontconfig1:amd64.
Preparing to unpack .../012-libfontconfig1_2.13.1-2ubuntu3_amd64.deb ...
Unpacking libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
Selecting previously unselected package liblcms2-2:amd64.
Preparing to unpack .../013-liblcms2-2_2.9-4_amd64.deb ...
Unpacking liblcms2-2:amd64 (2.9-4) ...
Selecting previously unselected package libjpeg-turbo8:amd64.
Preparing to unpack .../014-libjpeg-turbo8_2.0.3-0ubuntu1.20.04.3_amd64.deb ...
Unpacking libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.3) ...
Selecting previously unselected package libjpeg8:amd64.
Preparing to unpack .../015-libjpeg8_8c-2ubuntu8_amd64.deb ...
Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
Selecting previously unselected package libgraphite2-3:amd64.
Preparing to unpack .../016-libgraphite2-3_1.3.13-11build1_amd64.deb ...
Unpacking libgraphite2-3:amd64 (1.3.13-11build1) ...
Selecting previously unselected package libharfbuzz0b:amd64.
Preparing to unpack .../017-libharfbuzz0b_2.6.4-1ubuntu4.3_amd64.deb ...
Unpacking libharfbuzz0b:amd64 (2.6.4-1ubuntu4.3) ...
Selecting previously unselected package libpcsclite1:amd64.
Preparing to unpack .../018-libpcsclite1_1.8.26-3_amd64.deb ...
Unpacking libpcsclite1:amd64 (1.8.26-3) ...
Selecting previously unselected package openjdk-11-jre-headless:amd64.
Preparing to unpack .../019-openjdk-11-jre-headless_11.0.27+6~us1-0ubuntu1~20.04_amd64.deb ...
Unpacking openjdk-11-jre-headless:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
Selecting previously unselected package ca-certificates-java.
Preparing to unpack .../020-ca-certificates-java_20190405ubuntu1.1_all.deb ...
Unpacking ca-certificates-java (20190405ubuntu1.1) ...
Preparing to unpack .../021-curl_7.68.0-1ubuntu2.25_amd64.deb ...
Unpacking curl (7.68.0-1ubuntu2.25) over (7.68.0-1ubuntu2.13) ...
Preparing to unpack .../022-libcurl4_7.68.0-1ubuntu2.25_amd64.deb ...
Unpacking libcurl4:amd64 (7.68.0-1ubuntu2.25) over (7.68.0-1ubuntu2.13) ...
Selecting previously unselected package fonts-dejavu-extra.
Preparing to unpack .../023-fonts-dejavu-extra_2.37-1_all.deb ...
Unpacking fonts-dejavu-extra (2.37-1) ...
Preparing to unpack .../024-git_1%3a2.25.1-1ubuntu3.14_amd64.deb ...
Unpacking git (1:2.25.1-1ubuntu3.14) over (1:2.25.1-1ubuntu3.6) ...
Selecting previously unselected package libatk1.0-data.
Preparing to unpack .../025-libatk1.0-data_2.35.1-1ubuntu2_all.deb ...
Unpacking libatk1.0-data (2.35.1-1ubuntu2) ...
Selecting previously unselected package libatk1.0-0:amd64.
Preparing to unpack .../026-libatk1.0-0_2.35.1-1ubuntu2_amd64.deb ...
Unpacking libatk1.0-0:amd64 (2.35.1-1ubuntu2) ...
Selecting previously unselected package libatk-bridge2.0-0:amd64.
Preparing to unpack .../027-libatk-bridge2.0-0_2.34.2-0ubuntu2~20.04.1_amd64.deb ...
Unpacking libatk-bridge2.0-0:amd64 (2.34.2-0ubuntu2~20.04.1) ...
Selecting previously unselected package libfontenc1:amd64.
Preparing to unpack .../028-libfontenc1_1%3a1.1.4-0ubuntu1_amd64.deb ...
Unpacking libfontenc1:amd64 (1:1.1.4-0ubuntu1) ...
Selecting previously unselected package libglvnd0:amd64.
Preparing to unpack .../029-libglvnd0_1.3.2-1~ubuntu0.20.04.2_amd64.deb ...
Unpacking libglvnd0:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Selecting previously unselected package libglapi-mesa:amd64.
Preparing to unpack .../030-libglapi-mesa_21.2.6-0ubuntu0.1~20.04.2_amd64.deb ...
Unpacking libglapi-mesa:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Selecting previously unselected package libx11-xcb1:amd64.
Preparing to unpack .../031-libx11-xcb1_2%3a1.6.9-2ubuntu1.6_amd64.deb ...
Unpacking libx11-xcb1:amd64 (2:1.6.9-2ubuntu1.6) ...
Selecting previously unselected package libxcb-dri2-0:amd64.
Preparing to unpack .../032-libxcb-dri2-0_1.14-2_amd64.deb ...
Unpacking libxcb-dri2-0:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-dri3-0:amd64.
Preparing to unpack .../033-libxcb-dri3-0_1.14-2_amd64.deb ...
Unpacking libxcb-dri3-0:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-glx0:amd64.
Preparing to unpack .../034-libxcb-glx0_1.14-2_amd64.deb ...
Unpacking libxcb-glx0:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-present0:amd64.
Preparing to unpack .../035-libxcb-present0_1.14-2_amd64.deb ...
Unpacking libxcb-present0:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-shm0:amd64.
Preparing to unpack .../036-libxcb-shm0_1.14-2_amd64.deb ...
Unpacking libxcb-shm0:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-sync1:amd64.
Preparing to unpack .../037-libxcb-sync1_1.14-2_amd64.deb ...
Unpacking libxcb-sync1:amd64 (1.14-2) ...
Selecting previously unselected package libxcb-xfixes0:amd64.
Preparing to unpack .../038-libxcb-xfixes0_1.14-2_amd64.deb ...
Unpacking libxcb-xfixes0:amd64 (1.14-2) ...
Selecting previously unselected package libxfixes3:amd64.
Preparing to unpack .../039-libxfixes3_1%3a5.0.3-2_amd64.deb ...
Unpacking libxfixes3:amd64 (1:5.0.3-2) ...
Selecting previously unselected package libxshmfence1:amd64.
Preparing to unpack .../040-libxshmfence1_1.3-1_amd64.deb ...
Unpacking libxshmfence1:amd64 (1.3-1) ...
Selecting previously unselected package libxxf86vm1:amd64.
Preparing to unpack .../041-libxxf86vm1_1%3a1.1.4-1build1_amd64.deb ...
Unpacking libxxf86vm1:amd64 (1:1.1.4-1build1) ...
Selecting previously unselected package libdrm-amdgpu1:amd64.
Preparing to unpack .../042-libdrm-amdgpu1_2.4.107-8ubuntu1~20.04.2_amd64.deb ...
Unpacking libdrm-amdgpu1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Selecting previously unselected package libpciaccess0:amd64.
Preparing to unpack .../043-libpciaccess0_0.16-0ubuntu1_amd64.deb ...
Unpacking libpciaccess0:amd64 (0.16-0ubuntu1) ...
Selecting previously unselected package libdrm-intel1:amd64.
Preparing to unpack .../044-libdrm-intel1_2.4.107-8ubuntu1~20.04.2_amd64.deb ...
Unpacking libdrm-intel1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Selecting previously unselected package libdrm-nouveau2:amd64.
Preparing to unpack .../045-libdrm-nouveau2_2.4.107-8ubuntu1~20.04.2_amd64.deb ...
Unpacking libdrm-nouveau2:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Selecting previously unselected package libdrm-radeon1:amd64.
Preparing to unpack .../046-libdrm-radeon1_2.4.107-8ubuntu1~20.04.2_amd64.deb ...
Unpacking libdrm-radeon1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Selecting previously unselected package libllvm12:amd64.
Preparing to unpack .../047-libllvm12_1%3a12.0.0-3ubuntu1~20.04.5_amd64.deb ...
Unpacking libllvm12:amd64 (1:12.0.0-3ubuntu1~20.04.5) ...
Selecting previously unselected package libsensors-config.
Preparing to unpack .../048-libsensors-config_1%3a3.6.0-2ubuntu1.1_all.deb ...
Unpacking libsensors-config (1:3.6.0-2ubuntu1.1) ...
Selecting previously unselected package libsensors5:amd64.
Preparing to unpack .../049-libsensors5_1%3a3.6.0-2ubuntu1.1_amd64.deb ...
Unpacking libsensors5:amd64 (1:3.6.0-2ubuntu1.1) ...
Selecting previously unselected package libvulkan1:amd64.
Preparing to unpack .../050-libvulkan1_1.2.131.2-1_amd64.deb ...
Unpacking libvulkan1:amd64 (1.2.131.2-1) ...
Selecting previously unselected package libgl1-mesa-dri:amd64.
Preparing to unpack .../051-libgl1-mesa-dri_21.2.6-0ubuntu0.1~20.04.2_amd64.deb ...
Unpacking libgl1-mesa-dri:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Selecting previously unselected package libglx-mesa0:amd64.
Preparing to unpack .../052-libglx-mesa0_21.2.6-0ubuntu0.1~20.04.2_amd64.deb ...
Unpacking libglx-mesa0:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Selecting previously unselected package libglx0:amd64.
Preparing to unpack .../053-libglx0_1.3.2-1~ubuntu0.20.04.2_amd64.deb ...
Unpacking libglx0:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Selecting previously unselected package libgl1:amd64.
Preparing to unpack .../054-libgl1_1.3.2-1~ubuntu0.20.04.2_amd64.deb ...
Unpacking libgl1:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Selecting previously unselected package libice6:amd64.
Preparing to unpack .../055-libice6_2%3a1.0.10-0ubuntu1_amd64.deb ...
Unpacking libice6:amd64 (2:1.0.10-0ubuntu1) ...
Selecting previously unselected package libsm6:amd64.
Preparing to unpack .../056-libsm6_2%3a1.2.3-1_amd64.deb ...
Unpacking libsm6:amd64 (2:1.2.3-1) ...
Selecting previously unselected package libxt6:amd64.
Preparing to unpack .../057-libxt6_1%3a1.1.5-1_amd64.deb ...
Unpacking libxt6:amd64 (1:1.1.5-1) ...
Selecting previously unselected package libxmu6:amd64.
Preparing to unpack .../058-libxmu6_2%3a1.1.3-0ubuntu1_amd64.deb ...
Unpacking libxmu6:amd64 (2:1.1.3-0ubuntu1) ...
Selecting previously unselected package libxpm4:amd64.
Preparing to unpack .../059-libxpm4_1%3a3.5.12-1ubuntu0.20.04.2_amd64.deb ...
Unpacking libxpm4:amd64 (1:3.5.12-1ubuntu0.20.04.2) ...
Selecting previously unselected package libxaw7:amd64.
Preparing to unpack .../060-libxaw7_2%3a1.0.13-1_amd64.deb ...
Unpacking libxaw7:amd64 (2:1.0.13-1) ...
Selecting previously unselected package libxcb-shape0:amd64.
Preparing to unpack .../061-libxcb-shape0_1.14-2_amd64.deb ...
Unpacking libxcb-shape0:amd64 (1.14-2) ...
Selecting previously unselected package libxcomposite1:amd64.
Preparing to unpack .../062-libxcomposite1_1%3a0.4.5-1_amd64.deb ...
Unpacking libxcomposite1:amd64 (1:0.4.5-1) ...
Selecting previously unselected package libxrender1:amd64.
Preparing to unpack .../063-libxrender1_1%3a0.9.10-1_amd64.deb ...
Unpacking libxrender1:amd64 (1:0.9.10-1) ...
Selecting previously unselected package libxft2:amd64.
Preparing to unpack .../064-libxft2_2.3.3-0ubuntu1_amd64.deb ...
Unpacking libxft2:amd64 (2.3.3-0ubuntu1) ...
Selecting previously unselected package libxi6:amd64.
Preparing to unpack .../065-libxi6_2%3a1.7.10-0ubuntu1_amd64.deb ...
Unpacking libxi6:amd64 (2:1.7.10-0ubuntu1) ...
Selecting previously unselected package libxinerama1:amd64.
Preparing to unpack .../066-libxinerama1_2%3a1.1.4-2_amd64.deb ...
Unpacking libxinerama1:amd64 (2:1.1.4-2) ...
Selecting previously unselected package libxkbfile1:amd64.
Preparing to unpack .../067-libxkbfile1_1%3a1.1.0-1_amd64.deb ...
Unpacking libxkbfile1:amd64 (1:1.1.0-1) ...
Selecting previously unselected package libxrandr2:amd64.
Preparing to unpack .../068-libxrandr2_2%3a1.5.2-0ubuntu1_amd64.deb ...
Unpacking libxrandr2:amd64 (2:1.5.2-0ubuntu1) ...
Selecting previously unselected package libxv1:amd64.
Preparing to unpack .../069-libxv1_2%3a1.0.11-1_amd64.deb ...
Unpacking libxv1:amd64 (2:1.0.11-1) ...
Selecting previously unselected package libxxf86dga1:amd64.
Preparing to unpack .../070-libxxf86dga1_2%3a1.1.5-0ubuntu1_amd64.deb ...
Unpacking libxxf86dga1:amd64 (2:1.1.5-0ubuntu1) ...
Selecting previously unselected package x11-utils.
Preparing to unpack .../071-x11-utils_7.7+5_amd64.deb ...
Unpacking x11-utils (7.7+5) ...
Selecting previously unselected package libatk-wrapper-java.
Preparing to unpack .../072-libatk-wrapper-java_0.37.1-1_all.deb ...
Unpacking libatk-wrapper-java (0.37.1-1) ...
Selecting previously unselected package libatk-wrapper-java-jni:amd64.
Preparing to unpack .../073-libatk-wrapper-java-jni_0.37.1-1_amd64.deb ...
Unpacking libatk-wrapper-java-jni:amd64 (0.37.1-1) ...
Selecting previously unselected package libgif7:amd64.
Preparing to unpack .../074-libgif7_5.1.9-1ubuntu0.1_amd64.deb ...
Unpacking libgif7:amd64 (5.1.9-1ubuntu0.1) ...
Selecting previously unselected package libtcmalloc-minimal4:amd64.
Preparing to unpack .../075-libtcmalloc-minimal4_2.7-1ubuntu2_amd64.deb ...
Unpacking libtcmalloc-minimal4:amd64 (2.7-1ubuntu2) ...
Preparing to unpack .../076-libunwind8_1.2.1-9ubuntu0.1_amd64.deb ...
Unpacking libunwind8:amd64 (1.2.1-9ubuntu0.1) over (1.2.1-9build1) ...
Selecting previously unselected package libgoogle-perftools4:amd64.
Preparing to unpack .../077-libgoogle-perftools4_2.7-1ubuntu2_amd64.deb ...
Unpacking libgoogle-perftools4:amd64 (2.7-1ubuntu2) ...
Selecting previously unselected package liblzma-dev:amd64.
Preparing to unpack .../078-liblzma-dev_5.2.4-1ubuntu1.1_amd64.deb ...
Unpacking liblzma-dev:amd64 (5.2.4-1ubuntu1.1) ...
Selecting previously unselected package libunwind-dev:amd64.
Preparing to unpack .../079-libunwind-dev_1.2.1-9ubuntu0.1_amd64.deb ...
Unpacking libunwind-dev:amd64 (1.2.1-9ubuntu0.1) ...
Selecting previously unselected package libgoogle-perftools-dev:amd64.
Preparing to unpack .../080-libgoogle-perftools-dev_2.7-1ubuntu2_amd64.deb ...
Unpacking libgoogle-perftools-dev:amd64 (2.7-1ubuntu2) ...
Selecting previously unselected package xorg-sgml-doctools.
Preparing to unpack .../081-xorg-sgml-doctools_1%3a1.11-1_all.deb ...
Unpacking xorg-sgml-doctools (1:1.11-1) ...
Selecting previously unselected package x11proto-dev.
Preparing to unpack .../082-x11proto-dev_2019.2-1ubuntu1_all.deb ...
Unpacking x11proto-dev (2019.2-1ubuntu1) ...
Selecting previously unselected package x11proto-core-dev.
Preparing to unpack .../083-x11proto-core-dev_2019.2-1ubuntu1_all.deb ...
Unpacking x11proto-core-dev (2019.2-1ubuntu1) ...
Selecting previously unselected package libice-dev:amd64.
Preparing to unpack .../084-libice-dev_2%3a1.0.10-0ubuntu1_amd64.deb ...
Unpacking libice-dev:amd64 (2:1.0.10-0ubuntu1) ...
Selecting previously unselected package libjemalloc2:amd64.
Preparing to unpack .../085-libjemalloc2_5.2.1-1ubuntu1_amd64.deb ...
Unpacking libjemalloc2:amd64 (5.2.1-1ubuntu1) ...
Selecting previously unselected package libpthread-stubs0-dev:amd64.
Preparing to unpack .../086-libpthread-stubs0-dev_0.4-1_amd64.deb ...
Unpacking libpthread-stubs0-dev:amd64 (0.4-1) ...
Selecting previously unselected package libsm-dev:amd64.
Preparing to unpack .../087-libsm-dev_2%3a1.2.3-1_amd64.deb ...
Unpacking libsm-dev:amd64 (2:1.2.3-1) ...
Selecting previously unselected package libwayland-client0:amd64.
Preparing to unpack .../088-libwayland-client0_1.18.0-1ubuntu0.1_amd64.deb ...
Unpacking libwayland-client0:amd64 (1.18.0-1ubuntu0.1) ...
Selecting previously unselected package libxau-dev:amd64.
Preparing to unpack .../089-libxau-dev_1%3a1.0.9-0ubuntu1_amd64.deb ...
Unpacking libxau-dev:amd64 (1:1.0.9-0ubuntu1) ...
Selecting previously unselected package libxdmcp-dev:amd64.
Preparing to unpack .../090-libxdmcp-dev_1%3a1.1.3-0ubuntu1_amd64.deb ...
Unpacking libxdmcp-dev:amd64 (1:1.1.3-0ubuntu1) ...
Selecting previously unselected package xtrans-dev.
Preparing to unpack .../091-xtrans-dev_1.4.0-1_all.deb ...
Unpacking xtrans-dev (1.4.0-1) ...
Selecting previously unselected package libxcb1-dev:amd64.
Preparing to unpack .../092-libxcb1-dev_1.14-2_amd64.deb ...
Unpacking libxcb1-dev:amd64 (1.14-2) ...
Selecting previously unselected package libx11-dev:amd64.
Preparing to unpack .../093-libx11-dev_2%3a1.6.9-2ubuntu1.6_amd64.deb ...
Unpacking libx11-dev:amd64 (2:1.6.9-2ubuntu1.6) ...
Selecting previously unselected package libxcb-randr0:amd64.
Preparing to unpack .../094-libxcb-randr0_1.14-2_amd64.deb ...
Unpacking libxcb-randr0:amd64 (1.14-2) ...
Selecting previously unselected package libxt-dev:amd64.
Preparing to unpack .../095-libxt-dev_1%3a1.1.5-1_amd64.deb ...
Unpacking libxt-dev:amd64 (1:1.1.5-1) ...
Selecting previously unselected package mesa-vulkan-drivers:amd64.
Preparing to unpack .../096-mesa-vulkan-drivers_21.2.6-0ubuntu0.1~20.04.2_amd64.deb ...
Unpacking mesa-vulkan-drivers:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Selecting previously unselected package openjdk-11-jre:amd64.
Preparing to unpack .../097-openjdk-11-jre_11.0.27+6~us1-0ubuntu1~20.04_amd64.deb ...
Unpacking openjdk-11-jre:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
Selecting previously unselected package openjdk-11-jdk-headless:amd64.
Preparing to unpack .../098-openjdk-11-jdk-headless_11.0.27+6~us1-0ubuntu1~20.04_amd64.deb ...
Unpacking openjdk-11-jdk-headless:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
Selecting previously unselected package openjdk-11-jdk:amd64.
Preparing to unpack .../099-openjdk-11-jdk_11.0.27+6~us1-0ubuntu1~20.04_amd64.deb ...
Unpacking openjdk-11-jdk:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
Preparing to unpack .../100-python3-pip_20.0.2-5ubuntu1.11_all.deb ...
Unpacking python3-pip (20.0.2-5ubuntu1.11) over (20.0.2-5ubuntu1.6) ...
Preparing to unpack .../101-python-pip-whl_20.0.2-5ubuntu1.11_all.deb ...
Unpacking python-pip-whl (20.0.2-5ubuntu1.11) over (20.0.2-5ubuntu1.6) ...
Selecting previously unselected package libjemalloc-dev.
Preparing to unpack .../102-libjemalloc-dev_5.2.1-1ubuntu1_amd64.deb ...
Unpacking libjemalloc-dev (5.2.1-1ubuntu1) ...
Setting up libgraphite2-3:amd64 (1.3.13-11build1) ...
Setting up libxcb-dri3-0:amd64 (1.14-2) ...
Setting up liblcms2-2:amd64 (2.9-4) ...
Setting up libx11-xcb1:amd64 (2:1.6.9-2ubuntu1.6) ...
Setting up libpciaccess0:amd64 (0.16-0ubuntu1) ...
Setting up libdrm-nouveau2:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Setting up libxcb-xfixes0:amd64 (1.14-2) ...
Setting up java-common (0.72) ...
Setting up libdrm-radeon1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Setting up libglvnd0:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Setting up libxcb-glx0:amd64 (1.14-2) ...
Setting up libdrm-intel1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Setting up libxcb-shape0:amd64 (1.14-2) ...
Setting up x11-common (1:7.7+19ubuntu14) ...
update-rc.d: warning: start and stop actions are no longer supported; falling back to defaults
Setting up libsensors-config (1:3.6.0-2ubuntu1.1) ...
Setting up libtcmalloc-minimal4:amd64 (2.7-1ubuntu2) ...
Setting up libxcb-shm0:amd64 (1.14-2) ...
Setting up libjemalloc2:amd64 (5.2.1-1ubuntu1) ...
Setting up libunwind8:amd64 (1.2.1-9ubuntu0.1) ...
Setting up libpthread-stubs0-dev:amd64 (0.4-1) ...
Setting up libxcb-present0:amd64 (1.14-2) ...
Setting up libjemalloc-dev (5.2.1-1ubuntu1) ...
Setting up xtrans-dev (1.4.0-1) ...
Setting up libfontenc1:amd64 (1:1.1.4-0ubuntu1) ...
Setting up libxcb-sync1:amd64 (1.14-2) ...
Setting up libavahi-common-data:amd64 (0.7-4ubuntu7.3) ...
Setting up libllvm12:amd64 (1:12.0.0-3ubuntu1~20.04.5) ...
Setting up fonts-dejavu-core (2.37-1) ...
Setting up libpcsclite1:amd64 (1.8.26-3) ...
Setting up git (1:2.25.1-1ubuntu3.14) ...
Setting up libsensors5:amd64 (1:3.6.0-2ubuntu1.1) ...
Setting up libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.3) ...
Setting up libglapi-mesa:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Setting up libvulkan1:amd64 (1.2.131.2-1) ...
Setting up liblzma-dev:amd64 (5.2.4-1ubuntu1.1) ...
Setting up libxcb-dri2-0:amd64 (1.14-2) ...
Setting up libgif7:amd64 (5.1.9-1ubuntu0.1) ...
Setting up libatk1.0-data (2.35.1-1ubuntu2) ...
Setting up fonts-dejavu-extra (2.37-1) ...
Setting up libxshmfence1:amd64 (1.3-1) ...
Setting up libxcb-randr0:amd64 (1.14-2) ...
Setting up libcurl4:amd64 (7.68.0-1ubuntu2.25) ...
Setting up libx11-6:amd64 (2:1.6.9-2ubuntu1.6) ...
Setting up libharfbuzz0b:amd64 (2.6.4-1ubuntu4.3) ...
Setting up xorg-sgml-doctools (1:1.11-1) ...
Setting up python-pip-whl (20.0.2-5ubuntu1.11) ...
Setting up libatk1.0-0:amd64 (2.35.1-1ubuntu2) ...
Setting up curl (7.68.0-1ubuntu2.25) ...
Setting up libxkbfile1:amd64 (1:1.1.0-1) ...
Setting up libxcomposite1:amd64 (1:0.4.5-1) ...
Setting up libgoogle-perftools4:amd64 (2.7-1ubuntu2) ...
Setting up libdrm-amdgpu1:amd64 (2.4.107-8ubuntu1~20.04.2) ...
Setting up libwayland-client0:amd64 (1.18.0-1ubuntu0.1) ...
Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
Setting up x11proto-dev (2019.2-1ubuntu1) ...
Setting up mesa-vulkan-drivers:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Setting up libice6:amd64 (2:1.0.10-0ubuntu1) ...
Setting up libxau-dev:amd64 (1:1.0.9-0ubuntu1) ...
Setting up libxpm4:amd64 (1:3.5.12-1ubuntu0.20.04.2) ...
Setting up libunwind-dev:amd64 (1.2.1-9ubuntu0.1) ...
Setting up libxi6:amd64 (2:1.7.10-0ubuntu1) ...
Setting up libxrender1:amd64 (1:0.9.10-1) ...
Setting up libice-dev:amd64 (2:1.0.10-0ubuntu1) ...
Setting up fontconfig-config (2.13.1-2ubuntu3) ...
Setting up libxtst6:amd64 (2:1.2.3-1) ...
Setting up libgoogle-perftools-dev:amd64 (2.7-1ubuntu2) ...
Setting up libgl1-mesa-dri:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Setting up libavahi-common3:amd64 (0.7-4ubuntu7.3) ...
Setting up libxxf86dga1:amd64 (2:1.1.5-0ubuntu1) ...
Setting up libatspi2.0-0:amd64 (2.36.0-2) ...
Setting up libxxf86vm1:amd64 (1:1.1.4-1build1) ...
Setting up libatk-bridge2.0-0:amd64 (2.34.2-0ubuntu2~20.04.1) ...
Setting up libxdmcp-dev:amd64 (1:1.1.3-0ubuntu1) ...
Setting up libxfixes3:amd64 (1:5.0.3-2) ...
Setting up x11proto-core-dev (2019.2-1ubuntu1) ...
Setting up libxinerama1:amd64 (2:1.1.4-2) ...
Setting up libxv1:amd64 (2:1.0.11-1) ...
Setting up libxrandr2:amd64 (2:1.5.2-0ubuntu1) ...
Setting up python3-pip (20.0.2-5ubuntu1.11) ...
Setting up at-spi2-core (2.36.0-2) ...
Setting up libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
Setting up libsm6:amd64 (2:1.2.3-1) ...
Setting up libavahi-client3:amd64 (0.7-4ubuntu7.3) ...
Setting up libxft2:amd64 (2.3.3-0ubuntu1) ...
Setting up libglx-mesa0:amd64 (21.2.6-0ubuntu0.1~20.04.2) ...
Setting up libxcb1-dev:amd64 (1.14-2) ...
Setting up libglx0:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Setting up libsm-dev:amd64 (2:1.2.3-1) ...
Setting up libx11-dev:amd64 (2:1.6.9-2ubuntu1.6) ...
Setting up libgl1:amd64 (1.3.2-1~ubuntu0.20.04.2) ...
Setting up libxt6:amd64 (1:1.1.5-1) ...
Setting up libcups2:amd64 (2.3.1-9ubuntu1.9) ...
Setting up libxmu6:amd64 (2:1.1.3-0ubuntu1) ...
Setting up libxaw7:amd64 (2:1.0.13-1) ...
Setting up libxt-dev:amd64 (1:1.1.5-1) ...
Setting up x11-utils (7.7+5) ...
Setting up libatk-wrapper-java (0.37.1-1) ...
Setting up libatk-wrapper-java-jni:amd64 (0.37.1-1) ...
Setting up openjdk-11-jre-headless:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/java to provide /usr/bin/java (java) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jjs to provide /usr/bin/jjs (jjs) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/keytool to provide /usr/bin/keytool (keytool) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/rmid to provide /usr/bin/rmid (rmid) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/rmiregistry to provide /usr/bin/rmiregistry (rmiregistry) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/pack200 to provide /usr/bin/pack200 (pack200) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/unpack200 to provide /usr/bin/unpack200 (unpack200) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/lib/jexec to provide /usr/bin/jexec (jexec) in auto mode
Setting up openjdk-11-jre:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
Setting up openjdk-11-jdk-headless:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jar to provide /usr/bin/jar (jar) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jarsigner to provide /usr/bin/jarsigner (jarsigner) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/javac to provide /usr/bin/javac (javac) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/javadoc to provide /usr/bin/javadoc (javadoc) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/javap to provide /usr/bin/javap (javap) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jcmd to provide /usr/bin/jcmd (jcmd) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jdb to provide /usr/bin/jdb (jdb) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jdeprscan to provide /usr/bin/jdeprscan (jdeprscan) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jdeps to provide /usr/bin/jdeps (jdeps) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jfr to provide /usr/bin/jfr (jfr) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jimage to provide /usr/bin/jimage (jimage) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jinfo to provide /usr/bin/jinfo (jinfo) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jlink to provide /usr/bin/jlink (jlink) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jmap to provide /usr/bin/jmap (jmap) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jmod to provide /usr/bin/jmod (jmod) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jps to provide /usr/bin/jps (jps) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jrunscript to provide /usr/bin/jrunscript (jrunscript) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jshell to provide /usr/bin/jshell (jshell) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jstack to provide /usr/bin/jstack (jstack) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jstat to provide /usr/bin/jstat (jstat) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jstatd to provide /usr/bin/jstatd (jstatd) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/rmic to provide /usr/bin/rmic (rmic) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/serialver to provide /usr/bin/serialver (serialver) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jaotc to provide /usr/bin/jaotc (jaotc) in auto mode
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jhsdb to provide /usr/bin/jhsdb (jhsdb) in auto mode
Setting up openjdk-11-jdk:amd64 (11.0.27+6~us1-0ubuntu1~20.04) ...
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/jconsole to provide /usr/bin/jconsole (jconsole) in auto mode
Setting up ca-certificates-java (20190405ubuntu1.1) ...
head: cannot open '/etc/ssl/certs/java/cacerts' for reading: No such file or directory
Adding debian:Amazon_Root_CA_3.pem
Adding debian:IdenTrust_Commercial_Root_CA_1.pem
Adding debian:TrustCor_RootCert_CA-2.pem
Adding debian:Cybertrust_Global_Root.pem
Adding debian:GlobalSign_Root_CA_-_R2.pem
Adding debian:USERTrust_RSA_Certification_Authority.pem
Adding debian:XRamp_Global_CA_Root.pem
Adding debian:ANF_Secure_Server_Root_CA.pem
Adding debian:SecureTrust_CA.pem
Adding debian:Starfield_Root_Certificate_Authority_-_G2.pem
Adding debian:SSL.com_Root_Certification_Authority_RSA.pem
Adding debian:Trustwave_Global_ECC_P256_Certification_Authority.pem
Adding debian:GlobalSign_Root_R46.pem
Adding debian:TWCA_Root_Certification_Authority.pem
Adding debian:Microsoft_RSA_Root_Certificate_Authority_2017.pem
Adding debian:GLOBALTRUST_2020.pem
Adding debian:Go_Daddy_Root_Certificate_Authority_-_G2.pem
Adding debian:AffirmTrust_Networking.pem
Adding debian:emSign_Root_CA_-_G1.pem
Adding debian:Certigna_Root_CA.pem
Adding debian:Secure_Global_CA.pem
Adding debian:Izenpe.com.pem
Adding debian:Hellenic_Academic_and_Research_Institutions_RootCA_2015.pem
Adding debian:TrustCor_ECA-1.pem
Adding debian:Certigna.pem
Adding debian:QuoVadis_Root_CA_1_G3.pem
Adding debian:SwissSign_Silver_CA_-_G2.pem
Adding debian:SZAFIR_ROOT_CA2.pem
Adding debian:Entrust_Root_Certification_Authority_-_G4.pem
Adding debian:QuoVadis_Root_CA_3.pem
Adding debian:emSign_Root_CA_-_C1.pem
Adding debian:Atos_TrustedRoot_2011.pem
Adding debian:GTS_Root_R2.pem
Adding debian:DigiCert_Global_Root_G2.pem
Adding debian:OISTE_WISeKey_Global_Root_GB_CA.pem
Adding debian:QuoVadis_Root_CA_3_G3.pem
Adding debian:ACCVRAIZ1.pem
Adding debian:Actalis_Authentication_Root_CA.pem
Adding debian:GlobalSign_ECC_Root_CA_-_R4.pem
Adding debian:Hongkong_Post_Root_CA_3.pem
Adding debian:GlobalSign_ECC_Root_CA_-_R5.pem
Adding debian:DigiCert_Assured_ID_Root_G2.pem
Adding debian:Certum_Trusted_Network_CA_2.pem
Adding debian:D-TRUST_Root_Class_3_CA_2_EV_2009.pem
Adding debian:Entrust_Root_Certification_Authority_-_EC1.pem
Adding debian:Hellenic_Academic_and_Research_Institutions_RootCA_2011.pem
Adding debian:Microsoft_ECC_Root_Certificate_Authority_2017.pem
Adding debian:Entrust.net_Premium_2048_Secure_Server_CA.pem
Adding debian:emSign_ECC_Root_CA_-_C3.pem
Adding debian:Baltimore_CyberTrust_Root.pem
Adding debian:Entrust_Root_Certification_Authority_-_G2.pem
Adding debian:AffirmTrust_Premium_ECC.pem
Adding debian:Entrust_Root_Certification_Authority.pem
Adding debian:AffirmTrust_Premium.pem
Adding debian:Amazon_Root_CA_4.pem
Adding debian:Microsec_e-Szigno_Root_CA_2009.pem
Adding debian:QuoVadis_Root_CA_2_G3.pem
Adding debian:OISTE_WISeKey_Global_Root_GC_CA.pem
Adding debian:GTS_Root_R1.pem
Adding debian:AC_RAIZ_FNMT-RCM.pem
Adding debian:DigiCert_High_Assurance_EV_Root_CA.pem
Adding debian:certSIGN_Root_CA_G2.pem
Adding debian:COMODO_RSA_Certification_Authority.pem
Adding debian:Amazon_Root_CA_2.pem
Adding debian:SwissSign_Gold_CA_-_G2.pem
Adding debian:GlobalSign_Root_CA.pem
Adding debian:Starfield_Class_2_CA.pem
Adding debian:TrustCor_RootCert_CA-1.pem
Adding debian:Starfield_Services_Root_Certificate_Authority_-_G2.pem
Adding debian:DigiCert_Global_Root_G3.pem
Adding debian:Staat_der_Nederlanden_EV_Root_CA.pem
Adding debian:E-Tugra_Certification_Authority.pem
Adding debian:AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.pem
Adding debian:Security_Communication_Root_CA.pem
Adding debian:e-Szigno_Root_CA_2017.pem
Adding debian:EC-ACC.pem
Adding debian:SSL.com_Root_Certification_Authority_ECC.pem
Adding debian:Amazon_Root_CA_1.pem
Adding debian:TeliaSonera_Root_CA_v1.pem
Adding debian:Network_Solutions_Certificate_Authority.pem
Adding debian:Trustwave_Global_Certification_Authority.pem
Adding debian:Certum_EC-384_CA.pem
Adding debian:Hongkong_Post_Root_CA_1.pem
Adding debian:SecureSign_RootCA11.pem
Adding debian:CA_Disig_Root_R2.pem
Adding debian:GTS_Root_R3.pem
Adding debian:GlobalSign_Root_CA_-_R3.pem
Adding debian:Go_Daddy_Class_2_CA.pem
Adding debian:COMODO_ECC_Certification_Authority.pem
Adding debian:ePKI_Root_Certification_Authority.pem
Adding debian:T-TeleSec_GlobalRoot_Class_3.pem
Adding debian:COMODO_Certification_Authority.pem
Adding debian:SSL.com_EV_Root_Certification_Authority_RSA_R2.pem
Adding debian:IdenTrust_Public_Sector_Root_CA_1.pem
Adding debian:UCA_Global_G2_Root.pem
Adding debian:NAVER_Global_Root_Certification_Authority.pem
Adding debian:GlobalSign_Root_CA_-_R6.pem
Adding debian:SSL.com_EV_Root_Certification_Authority_ECC.pem
Adding debian:GTS_Root_R4.pem
Adding debian:Buypass_Class_2_Root_CA.pem
Adding debian:Certum_Trusted_Network_CA.pem
Adding debian:TWCA_Global_Root_CA.pem
Adding debian:Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
Adding debian:NetLock_Arany_=Class_Gold=_Főtanúsítvány.pem
Adding debian:T-TeleSec_GlobalRoot_Class_2.pem
Adding debian:Trustwave_Global_ECC_P384_Certification_Authority.pem
Adding debian:USERTrust_ECC_Certification_Authority.pem
Adding debian:AffirmTrust_Commercial.pem
Adding debian:TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.pem
Adding debian:DigiCert_Assured_ID_Root_CA.pem
Adding debian:GlobalSign_Root_E46.pem
Adding debian:Comodo_AAA_Services_root.pem
Adding debian:Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.pem
Adding debian:DigiCert_Assured_ID_Root_G3.pem
Adding debian:DigiCert_Trusted_Root_G4.pem
Adding debian:emSign_ECC_Root_CA_-_G3.pem
Adding debian:D-TRUST_Root_Class_3_CA_2_2009.pem
Adding debian:Security_Communication_RootCA2.pem
Adding debian:DigiCert_Global_Root_CA.pem
Adding debian:QuoVadis_Root_CA_2.pem
Adding debian:ISRG_Root_X1.pem
Adding debian:certSIGN_ROOT_CA.pem
Adding debian:CFCA_EV_ROOT.pem
Adding debian:GDCA_TrustAUTH_R5_ROOT.pem
Adding debian:Certum_Trusted_Root_CA.pem
Adding debian:UCA_Extended_Validation_Root.pem
Adding debian:Buypass_Class_3_Root_CA.pem
done.
Processing triggers for mime-support (3.64ubuntu1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.9) ...
Processing triggers for systemd (245.4-4ubuntu3.17) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for ca-certificates (20211016~20.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...

done.
done.
🐍 [3/8] 安装 Python 包...
Looking in indexes: https://mirrors.bfsu.edu.cn/pypi/web/simple
Requirement already satisfied: pip in ./miniconda3/lib/python3.8/site-packages (21.2.4)
Collecting pip
  Downloading https://mirrors.bfsu.edu.cn/pypi/web/packages/c9/bc/b7db44f5f39f9d0494071bddae6880eb645970366d0a200022a1a93d57f5/pip-25.0.1-py3-none-any.whl (1.8 MB)
     |████████████████████████████████| 1.8 MB 6.8 MB/s 
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 21.2.4
    Uninstalling pip-21.2.4:
      Successfully uninstalled pip-21.2.4
Successfully installed pip-25.0.1
Looking in indexes: https://mirrors.bfsu.edu.cn/pypi/web/simple
Collecting orderedmultidict
  Downloading https://mirrors.bfsu.edu.cn/pypi/web/packages/04/16/5e95c70bda8fe6ea715005c0db8e602400bdba50ae3c72cb380eba551289/orderedmultidict-1.0.1-py2.py3-none-any.whl (11 kB)
Requirement already satisfied: six>=1.8.0 in ./miniconda3/lib/python3.8/site-packages (from orderedmultidict) (1.16.0)
Installing collected packages: orderedmultidict
Successfully installed orderedmultidict-1.0.1
🔨 [4/8] 安装 CMake 3.27.9 到 /opt/cmake...
--2025-07-22 09:20:18--  https://github.com/Kitware/CMake/releases/download/v3.27.9/cmake-3.27.9-linux-x86_64.sh
Connecting to 192.168.1.33:7890... connected.
Proxy request sent, awaiting response... 302 Found
Location: https://release-assets.githubusercontent.com/github-production-release-asset/537699/fa59af7c-ceb4-4008-bd0b-c7ed0f438b45?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-07-22T10%3A07%3A37Z&rscd=attachment%3B+filename%3Dcmake-3.27.9-linux-x86_64.sh&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-07-22T09%3A06%3A56Z&ske=2025-07-22T10%3A07%3A37Z&sks=b&skv=2018-11-09&sig=422HspzuKNO%2BTO%2Bf1h%2FQy2rvv9yg1EOZYx8vlbqIVk0%3D&jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc1MzE3NjMxOSwibmJmIjoxNzUzMTc2MDE5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.W9EZTMjd3PAdUJBztJRrGBliB9grpnlEVsX6M5gdinc&response-content-disposition=attachment%3B%20filename%3Dcmake-3.27.9-linux-x86_64.sh&response-content-type=application%2Foctet-stream [following]
--2025-07-22 09:20:19--  https://release-assets.githubusercontent.com/github-production-release-asset/537699/fa59af7c-ceb4-4008-bd0b-c7ed0f438b45?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-07-22T10%3A07%3A37Z&rscd=attachment%3B+filename%3Dcmake-3.27.9-linux-x86_64.sh&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-07-22T09%3A06%3A56Z&ske=2025-07-22T10%3A07%3A37Z&sks=b&skv=2018-11-09&sig=422HspzuKNO%2BTO%2Bf1h%2FQy2rvv9yg1EOZYx8vlbqIVk0%3D&jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc1MzE3NjMxOSwibmJmIjoxNzUzMTc2MDE5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.W9EZTMjd3PAdUJBztJRrGBliB9grpnlEVsX6M5gdinc&response-content-disposition=attachment%3B%20filename%3Dcmake-3.27.9-linux-x86_64.sh&response-content-type=application%2Foctet-stream
Connecting to 192.168.1.33:7890... connected.
Proxy request sent, awaiting response... 200 OK
Length: 51679115 (49M) [application/octet-stream]
Saving to: ‘cmake-3.27.9-linux-x86_64.sh’

cmake-3.27.9-linux-x86_64.sh  100%[===============================================>]  49.28M  3.74MB/s    in 12s     

2025-07-22 09:20:32 (4.01 MB/s) - ‘cmake-3.27.9-linux-x86_64.sh’ saved [51679115/51679115]

CMake Installer Version: 3.27.9, Copyright (c) Kitware
This is a self-extracting archive.
The archive will be extracted to: /opt/cmake

Using target directory: /opt/cmake
Extracting, please wait...

Unpacking finished successfully
✅ CMake 安装完成: cmake version 3.27.9
📥 [5/8] 克隆 Surelog 仓库及子模块...
Cloning into 'Surelog'...
remote: Enumerating objects: 271053, done.
remote: Counting objects: 100% (544/544), done.
remote: Compressing objects: 100% (396/396), done.
remote: Total 271053 (delta 201), reused 311 (delta 146), pack-reused 270509 (from 3)
Receiving objects: 100% (271053/271053), 861.16 MiB | 3.21 MiB/s, done.
Resolving deltas: 100% (122332/122332), done.
Updating files: 100% (27371/27371), done.
Submodule 'third_party/UHDM' (https://github.com/chipsalliance/UHDM.git) registered for path 'third_party/UHDM'
Submodule 'third_party/antlr4' (https://github.com/antlr/antlr4.git) registered for path 'third_party/antlr4'
Submodule 'third_party/googletest' (https://github.com/google/googletest.git) registered for path 'third_party/googletest'
Submodule 'third_party/json' (https://github.com/nlohmann/json.git) registered for path 'third_party/json'
Cloning into '/home/hx/Surelog/third_party/UHDM'...
Cloning into '/home/hx/Surelog/third_party/antlr4'...
Cloning into '/home/hx/Surelog/third_party/googletest'...
Cloning into '/home/hx/Surelog/third_party/json'...
Submodule path 'third_party/UHDM': checked out '5ad41c56f1a6f5b697cbeb6eb16c166324aef8f9'
Submodule 'third_party/capnproto' (https://github.com/capnproto/capnproto.git) registered for path 'third_party/UHDM/third_party/capnproto'
Submodule 'third_party/googletest' (https://github.com/google/googletest.git) registered for path 'third_party/UHDM/third_party/googletest'
Cloning into '/home/hx/Surelog/third_party/UHDM/third_party/capnproto'...
Cloning into '/home/hx/Surelog/third_party/UHDM/third_party/googletest'...
Submodule path 'third_party/UHDM/third_party/capnproto': checked out '8c7e0fdbf101c477aaad3ae792b16871c271fa24'
Submodule path 'third_party/UHDM/third_party/googletest': checked out '58d77fa8070e8cec2dc1ed015d66b454c8d78850'
Submodule path 'third_party/antlr4': checked out '09d527fddd8dcd3733d7275cf3436a1a9e1e12db'
Submodule path 'third_party/googletest': checked out '8a6feabf04bec8fb125e0df0ad1195c42350725f'
Submodule path 'third_party/json': checked out '788e5468e4cb4573941600d5c39ccd552dc8a429'
⚙️ [6/8] 使用 CMake 配置项目...
-- The C compiler identification is GNU 9.4.0
-- The CXX compiler identification is GNU 9.4.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
Building Surelog version v1.84 [700f6596467f85b9f6d81bbfd770b449f5073155]
-- Building without demo. To enable demo build use: -DWITH_DEMO=True
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - found
-- Found Threads: TRUE  
-- Found Python3: /home/hx/miniconda3/bin/python3.8 (found version "3.8.13") found components: Interpreter 
-- Python3_EXECUTABLE = /home/hx/miniconda3/bin/python3.8
CMake Deprecation Warning at third_party/UHDM/third_party/capnproto/CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- Looking for C++ include initializer_list
-- Looking for C++ include initializer_list - found
-- Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the system variable OPENSSL_ROOT_DIR (missing: OPENSSL_CRYPTO_LIBRARY OPENSSL_INCLUDE_DIR Crypto SSL) 
-- Found ZLIB: /usr/lib/x86_64-linux-gnu/libz.so (found version "1.2.11")  
Building UHDM version v1.84 [5ad41c56f1a6f5b697cbeb6eb16c166324aef8f9]
CMake Deprecation Warning at third_party/json/CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- Using the multi-header code from /home/hx/Surelog/third_party/json/include/
-- Found Python3: /home/hx/miniconda3/bin/python3.8 (found suitable version "3.8.13", minimum required is "3.3") found components: Interpreter 
-- Python3_EXECUTABLE = /home/hx/miniconda3/bin/python3.8
CMake Warning at CMakeLists.txt:194 (message):
  Using tcmalloc; if this creates runtime issues, configure with
  -DSURELOG_WITH_TCMALLOC=Off


-- Found tcmalloc: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
-- Found zlib: /usr/lib/x86_64-linux-gnu/libz.so
-- Found Java: /usr/bin/java (found suitable version "11.0.27", minimum required is "11") found components: Runtime 
-- Java_JAVA_EXECUTABLE = /usr/bin/java
-- Configuring done (2.1s)
-- Generating done (0.1s)
-- Build files have been written to: /home/hx/Surelog/build
🧱 [7/8] 编译 Surelog 中（可能需要几分钟）...
[  0%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/array.c++.o
[  0%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/cidr.c++.o
[  0%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/common.c++.o
[  0%] Built target surelog_link_target
[  0%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/list.c++.o
[  0%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/debug.c++.o
[  1%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/exception.c++.o
[  1%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ANTLRErrorListener.cpp.o
[  1%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ANTLRErrorListener.cpp.o
[  1%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/io.c++.o
[  1%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/memory.c++.o
[  1%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/mutex.c++.o
[  1%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/string.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/source-location.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/hash.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/table.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/thread.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/main.c++.o
[  2%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/arena.c++.o
[  2%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ANTLRErrorStrategy.cpp.o
[  2%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ANTLRErrorStrategy.cpp.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/test-helpers.c++.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/units.c++.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/encoding.c++.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/refcount.c++.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/string-tree.c++.o
[  3%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ANTLRFileStream.cpp.o
[  3%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ANTLRFileStream.cpp.o
[  3%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/time.c++.o
[  4%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/filesystem.c++.o
[  4%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/filesystem-disk-unix.c++.o
[  4%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/filesystem-disk-win32.c++.o
[  4%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj.dir/parse/char.c++.o
[  4%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ANTLRInputStream.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/BailErrorStrategy.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ANTLRInputStream.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/BaseErrorListener.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/BufferedTokenStream.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/CharStream.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/CommonToken.cpp.o
[  5%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/CommonTokenFactory.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/CommonTokenStream.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/BailErrorStrategy.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ConsoleErrorListener.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/DefaultErrorStrategy.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/DiagnosticErrorListener.cpp.o
[  6%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Exceptions.cpp.o
[  7%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/FailedPredicateException.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/BaseErrorListener.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/InputMismatchException.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/IntStream.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/InterpreterRuleContext.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/BufferedTokenStream.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Lexer.cpp.o
[  9%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/LexerInterpreter.cpp.o
[ 10%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/LexerNoViableAltException.cpp.o
[ 10%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ListTokenSource.cpp.o
[ 10%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/NoViableAltException.cpp.o
[ 10%] Linking CXX static library libkj.a
[ 10%] Built target kj
[ 10%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/c++.capnp.c++.o
[ 10%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Parser.cpp.o
[ 11%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/blob.c++.o
[ 11%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/arena.c++.o
[ 11%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ParserInterpreter.cpp.o
[ 11%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/CharStream.cpp.o
[ 11%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ParserRuleContext.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/ProxyErrorListener.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/RecognitionException.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Recognizer.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/CommonToken.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/RuleContext.cpp.o
[ 12%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/layout.c++.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/RuleContextWithAltNum.cpp.o
[ 12%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/RuntimeMetaData.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Token.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/TokenSource.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/CommonTokenFactory.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/TokenStream.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/TokenStreamRewriter.cpp.o
[ 13%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/UnbufferedCharStream.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/UnbufferedTokenStream.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/Vocabulary.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/WritableToken.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/CommonTokenStream.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATN.cpp.o
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp: In static member function ‘static void antlr4::dfa::Vocabulary::__static_initialization_and_destruction_0(int, int)’:
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp:17:18: warning: ‘antlr4::dfa::Vocabulary::EMPTY_VOCABULARY’ is deprecated: Use the default constructor of Vocabulary instead. [-Wdeprecated-declarations]
   17 | const Vocabulary Vocabulary::EMPTY_VOCABULARY;
      |                  ^~~~~~~~~~
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp:17:18: note: declared here
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNConfig.cpp.o
[ 14%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNConfigSet.cpp.o
[ 15%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNDeserializationOptions.cpp.o
[ 15%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNDeserializer.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ConsoleErrorListener.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNSimulator.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNState.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ATNStateType.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ActionTransition.cpp.o
[ 17%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/DefaultErrorStrategy.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/AmbiguityInfo.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ArrayPredictionContext.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/AtomTransition.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ContextSensitivityInfo.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/DecisionEventInfo.cpp.o
[ 18%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/DecisionInfo.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/DecisionState.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/EpsilonTransition.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/DiagnosticErrorListener.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ErrorInfo.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LL1Analyzer.cpp.o
[ 19%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerATNConfig.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerATNSimulator.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerAction.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerActionExecutor.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerChannelAction.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerCustomAction.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Exceptions.cpp.o
[ 20%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerIndexedCustomAction.cpp.o
[ 20%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/list.c++.o
[ 21%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerModeAction.cpp.o
[ 21%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/any.c++.o
[ 21%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerMoreAction.cpp.o
[ 21%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerPopModeAction.cpp.o
[ 22%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/message.c++.o
[ 22%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerPushModeAction.cpp.o
[ 22%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/FailedPredicateException.cpp.o
[ 22%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerSkipAction.cpp.o
[ 22%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LexerTypeAction.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/LookaheadEventInfo.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/NotSetTransition.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/OrderedATNConfigSet.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ParseInfo.cpp.o
[ 23%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/schema.capnp.c++.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ParserATNSimulator.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/InputMismatchException.cpp.o
[ 23%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PrecedencePredicateTransition.cpp.o
[ 25%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredicateEvalInfo.cpp.o
[ 25%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/stream.capnp.c++.o
[ 25%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredicateTransition.cpp.o
[ 25%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/serialize.c++.o
[ 25%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredictionContext.cpp.o
[ 26%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/IntStream.cpp.o
[ 26%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredictionContextCache.cpp.o
[ 26%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredictionContextMergeCache.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/PredictionMode.cpp.o
[ 27%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/serialize-packed.c++.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/ProfilingATNSimulator.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/InterpreterRuleContext.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/RangeTransition.cpp.o
[ 27%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/schema.c++.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/RuleTransition.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Lexer.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/SemanticContext.cpp.o
[ 27%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/SetTransition.cpp.o
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/capnp/schema.c++: In member function ‘capnp::Type capnp::Schema::BrandArgumentList::operator[](capnp::uint) const’:
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/capnp/schema.c++:444:12: warning: ‘*((void*)& result +4)’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  444 |     result = Type(static_cast<schema::Type::Which>(binding.which), binding.schema);
      |     ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/SingletonPredictionContext.cpp.o
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/StarLoopbackState.cpp.o
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/Transition.cpp.o
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/TransitionType.cpp.o
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/LexerInterpreter.cpp.o
[ 28%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/atn/WildcardTransition.cpp.o
[ 29%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/schema-loader.c++.o
[ 29%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/dfa/DFA.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/dfa/DFASerializer.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/dfa/DFAState.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/dfa/LexerDFASerializer.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/internal/Synchronization.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/misc/InterpreterDataReader.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/LexerNoViableAltException.cpp.o
[ 30%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/misc/Interval.cpp.o
[ 31%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/misc/IntervalSet.cpp.o
[ 31%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/misc/MurmurHash.cpp.o
[ 31%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/misc/Predicate.cpp.o
[ 31%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/support/Any.cpp.o
[ 31%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/support/Arrays.cpp.o
[ 32%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/support/CPPUtils.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ListTokenSource.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/support/StringUtils.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/support/Utf8.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/ErrorNodeImpl.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/IterativeParseTreeWalker.cpp.o
[ 34%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/ParseTree.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/ParseTreeListener.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/ParseTreeVisitor.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/NoViableAltException.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/ParseTreeWalker.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/TerminalNodeImpl.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/Trees.cpp.o
[ 35%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/Chunk.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/ParseTreeMatch.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/ParseTreePattern.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/ParseTreePatternMatcher.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/RuleTagToken.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Parser.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/TagChunk.cpp.o
[ 36%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/TextChunk.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/pattern/TokenTagToken.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPath.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathElement.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathLexer.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathLexerErrorListener.cpp.o
[ 37%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathRuleAnywhereElement.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathRuleElement.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathTokenAnywhereElement.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ParserInterpreter.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathTokenElement.cpp.o
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/tree/xpath/XPathLexer.cpp: In member function ‘void XPathLexer::IDAction(antlr4::RuleContext*, size_t)’:
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/tree/xpath/XPathLexer.cpp:164:48: warning: unused parameter ‘context’ [-Wunused-parameter]
  164 | void XPathLexer::IDAction(antlr4::RuleContext *context, size_t actionIndex) {
      |                           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
[ 38%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/dynamic.c++.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathWildcardAnywhereElement.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_shared.dir/src/tree/xpath/XPathWildcardElement.cpp.o
[ 38%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp.dir/stringify.c++.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ParserRuleContext.cpp.o
[ 38%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/ProxyErrorListener.cpp.o
[ 39%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/RecognitionException.cpp.o
[ 39%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Recognizer.cpp.o
[ 40%] Linking CXX shared library libantlr4-runtime.so
[ 40%] Built target antlr4_shared
[ 40%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async.c++.o
[ 40%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/RuleContext.cpp.o
[ 40%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/RuleContextWithAltNum.cpp.o
[ 40%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/RuntimeMetaData.cpp.o
[ 40%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Token.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/TokenSource.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/TokenStream.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/TokenStreamRewriter.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/UnbufferedCharStream.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/UnbufferedTokenStream.cpp.o
[ 42%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/Vocabulary.cpp.o
[ 43%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/WritableToken.cpp.o
[ 43%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATN.cpp.o
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp: In static member function ‘static void antlr4::dfa::Vocabulary::__static_initialization_and_destruction_0(int, int)’:
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp:17:18: warning: ‘antlr4::dfa::Vocabulary::EMPTY_VOCABULARY’ is deprecated: Use the default constructor of Vocabulary instead. [-Wdeprecated-declarations]
   17 | const Vocabulary Vocabulary::EMPTY_VOCABULARY;
      |                  ^~~~~~~~~~
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/Vocabulary.cpp:17:18: note: declared here
[ 43%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNConfig.cpp.o
[ 43%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNConfigSet.cpp.o
[ 43%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNDeserializationOptions.cpp.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNDeserializer.cpp.o
[ 44%] Linking CXX static library libcapnp.a
[ 44%] Built target capnp
[ 44%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc_cpp.dir/compiler/capnpc-c++.c++.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNSimulator.cpp.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNState.cpp.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ATNStateType.cpp.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ActionTransition.cpp.o
[ 44%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/AmbiguityInfo.cpp.o
[ 45%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ArrayPredictionContext.cpp.o
[ 45%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/AtomTransition.cpp.o
[ 45%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ContextSensitivityInfo.cpp.o
[ 45%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/DecisionEventInfo.cpp.o
[ 45%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/DecisionInfo.cpp.o
[ 46%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async-unix.c++.o
[ 46%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/DecisionState.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/EpsilonTransition.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ErrorInfo.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LL1Analyzer.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerATNConfig.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerATNSimulator.cpp.o
[ 47%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerAction.cpp.o
[ 48%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerActionExecutor.cpp.o
[ 48%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerChannelAction.cpp.o
[ 48%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerCustomAction.cpp.o
[ 48%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerIndexedCustomAction.cpp.o
[ 48%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerModeAction.cpp.o
[ 48%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async-win32.c++.o
[ 48%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async-io-win32.c++.o
[ 48%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async-io.c++.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerMoreAction.cpp.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerPopModeAction.cpp.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerPushModeAction.cpp.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerSkipAction.cpp.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LexerTypeAction.cpp.o
[ 50%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/LookaheadEventInfo.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/NotSetTransition.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/OrderedATNConfigSet.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ParseInfo.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ParserATNSimulator.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PrecedencePredicateTransition.cpp.o
[ 51%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredicateEvalInfo.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredicateTransition.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredictionContext.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredictionContextCache.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredictionContextMergeCache.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/PredictionMode.cpp.o
[ 52%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/ProfilingATNSimulator.cpp.o
[ 53%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/RangeTransition.cpp.o
[ 53%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/RuleTransition.cpp.o
[ 53%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/SemanticContext.cpp.o
[ 53%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/SetTransition.cpp.o
[ 53%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/SingletonPredictionContext.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/StarLoopbackState.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/Transition.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/TransitionType.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/atn/WildcardTransition.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/dfa/DFA.cpp.o
[ 54%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/dfa/DFASerializer.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/dfa/DFAState.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/dfa/LexerDFASerializer.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/internal/Synchronization.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/misc/InterpreterDataReader.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/misc/Interval.cpp.o
[ 55%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/misc/IntervalSet.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/misc/MurmurHash.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/misc/Predicate.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/support/Any.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/support/Arrays.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/support/CPPUtils.cpp.o
[ 56%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/support/StringUtils.cpp.o
[ 57%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/support/Utf8.cpp.o
[ 57%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/ErrorNodeImpl.cpp.o
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/kj/async-io.c++: In lambda function:
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/kj/async-io.c++:2196:31: warning: ‘*((void*)& bufferPtr +16)’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 2196 |         Maybe<ArrayPtr<byte>> bufferPtr = nullptr;
      |                               ^~~~~~~~~
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/kj/async-io.c++:2196:31: warning: ‘*((void*)& bufferPtr +8)’ may be used uninitialized in this function [-Wmaybe-uninitialized]
[ 57%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/IterativeParseTreeWalker.cpp.o
[ 57%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/ParseTree.cpp.o
[ 57%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/ParseTreeListener.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/ParseTreeVisitor.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/ParseTreeWalker.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/TerminalNodeImpl.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/Trees.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/Chunk.cpp.o
[ 59%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/ParseTreeMatch.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/ParseTreePattern.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/ParseTreePatternMatcher.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/RuleTagToken.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/TagChunk.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/TextChunk.cpp.o
[ 60%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/pattern/TokenTagToken.cpp.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPath.cpp.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathElement.cpp.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathLexer.cpp.o
[ 61%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/async-io-unix.c++.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathLexerErrorListener.cpp.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathRuleAnywhereElement.cpp.o
[ 61%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathRuleElement.cpp.o
[ 62%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathTokenAnywhereElement.cpp.o
[ 62%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathTokenElement.cpp.o
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/tree/xpath/XPathLexer.cpp: In member function ‘void XPathLexer::IDAction(antlr4::RuleContext*, size_t)’:
/home/hx/Surelog/third_party/antlr4/runtime/Cpp/runtime/src/tree/xpath/XPathLexer.cpp:164:48: warning: unused parameter ‘context’ [-Wunused-parameter]
  164 | void XPathLexer::IDAction(antlr4::RuleContext *context, size_t actionIndex) {
      |                           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
[ 62%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathWildcardAnywhereElement.cpp.o
[ 62%] Building CXX object third_party/antlr4/runtime/Cpp/runtime/CMakeFiles/antlr4_static.dir/src/tree/xpath/XPathWildcardElement.cpp.o
[ 63%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/kj/CMakeFiles/kj-async.dir/timer.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/type-id.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/error-reporter.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/lexer.capnp.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/lexer.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/grammar.capnp.c++.o
[ 64%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/parser.c++.o
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/generics.c++.o
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/node-translator.c++.o
[ 65%] Linking CXX static library libantlr4-runtime.a
[ 65%] Built target antlr4_static
[ 65%] Generating generated/src/parser/SV3_1aLexer.h, generated/src/parser/SV3_1aParserBaseListener.h, generated/src/parser/SV3_1aParser.h, generated/src/parser/SV3_1aParserListener.h, generated/src/parser/SV3_1aLexer.cpp, generated/src/parser/SV3_1aParserBaseListener.cpp, generated/src/parser/SV3_1aParser.cpp, generated/src/parser/SV3_1aParserListener.cpp, generated/src/parser/SV3_1aPpLexer.h, generated/src/parser/SV3_1aPpParserBaseListener.h, generated/src/parser/SV3_1aPpParser.h, generated/src/parser/SV3_1aPpParserListener.h, generated/src/parser/SV3_1aPpLexer.cpp, generated/src/parser/SV3_1aPpParserBaseListener.cpp, generated/src/parser/SV3_1aPpParser.cpp, generated/src/parser/SV3_1aPpParserListener.cpp, generated/src/parser/generated-parsers.tstamp
---------- Parser generation...
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/compiler/compiler.c++.o
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/schema-parser.c++.o
[ 65%] Linking CXX static library libkj-async.a
[ 65%] Built target kj-async
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnpc.dir/serialize-text.c++.o
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/capnp/compiler/node-translator.c++: In member function ‘virtual capnp::uint capnp::compiler::NodeTranslator::StructLayout::Group::addData(capnp::uint)’:
/home/hx/Surelog/third_party/UHDM/third_party/capnproto/c++/src/capnp/compiler/node-translator.c++:496:45: warning: ‘*((void*)& bestLocation +4)’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  496 |         return parentDataLocationUsage[*best].allocateFromHole(
      |                                             ^
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp-json.dir/compat/json.c++.o
[ 65%] Built target GenerateParser
[ 65%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp-json.dir/compat/json.capnp.c++.o
[ 65%] Linking CXX static library libcapnpc.a
[ 65%] Built target capnpc
[ 67%] Linking CXX static library libcapnp-json.a
[ 67%] Built target capnp-json
[ 67%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp_tool.dir/compiler/module-loader.c++.o
[ 67%] Building CXX object third_party/UHDM/third_party/capnproto/c++/src/capnp/CMakeFiles/capnp_tool.dir/compiler/capnp.c++.o
[ 67%] Linking CXX executable capnpc-c++
[ 67%] Built target capnpc_cpp
[ 67%] Linking CXX executable capnp
[ 67%] Built target capnp_tool
[ 67%] Generating generated/src/UHDM.capnp
Configuration update: srcdir=/home/hx/Surelog/third_party/UHDM, headers=/home/hx/Surelog/build/third_party/UHDM/generated/uhdm, sources=/home/hx/Surelog/build/third_party/UHDM/generated/src
Generating UHDM models ...
   Loading models ...
   ... found 270 models.
   Validating ordering ...
   ... all good.
   ... capnp
   ... class_hierarchy
   ... classes
   ... containers_h
   ... ElaboratorListener_cpp
   ... Copier
   ... serializer
   ... uhdm_forward_decl_h
   ... uhdm_h
   ... uhdm_types_h
   ... UhdmListener
   ... vpi_user_cpp
   ... vpi_visitor
   ... VpiListener
   ... VpiListenerTracer_h
... all done!
UHDM Models generated successfully!.
[ 68%] Generating generated/src/UHDM.capnp.h, generated/src/UHDM.capnp.c++
[ 68%] Built target GenerateCode
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/BaseClass.cpp.o
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/clone_tree.cpp.o
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/ElaboratorListener.cpp.o
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/ExprEval.cpp.o
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/Serializer.cpp.o
[ 68%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/Serializer_save.cpp.o
[ 69%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/NumUtils.cpp.o
[ 69%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/Serializer_restore.cpp.o
[ 69%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/SymbolFactory.cpp.o
[ 69%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/SymbolId.cpp.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/SynthSubset.cpp.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/UHDM.capnp.c++.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/UhdmLint.cpp.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/UhdmAdjuster.cpp.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/UhdmListener.cpp.o
[ 70%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/VpiListener.cpp.o
[ 71%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/vpi_user.cpp.o
[ 71%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/vpi_visitor.cpp.o
[ 71%] Building CXX object third_party/UHDM/CMakeFiles/uhdm.dir/generated/src/classes.cpp.o
[ 71%] Linking CXX static library lib/libuhdm.a
[ 71%] Built target uhdm
[ 72%] Generating generated/include/Surelog/Cache/Cache.capnp.h, generated/include/Surelog/Cache/Cache.capnp.c++, generated/include/Surelog/Cache/PPCache.capnp.h, generated/include/Surelog/Cache/PPCache.capnp.c++, generated/include/Surelog/Cache/ParseCache.capnp.h, generated/include/Surelog/Cache/ParseCache.capnp.c++, generated/include/Surelog/Cache/PythonAPICache.capnp.h, generated/include/Surelog/Cache/PythonAPICache.capnp.c++
[ 71%] Building CXX object third_party/UHDM/CMakeFiles/uhdm-cmp.dir/util/uhdm-cmp.cpp.o
[ 72%] Building CXX object third_party/UHDM/CMakeFiles/uhdm-dump.dir/util/uhdm-dump.cpp.o
[ 72%] Building CXX object third_party/UHDM/CMakeFiles/uhdm-lint.dir/util/uhdm-lint.cpp.o
[ 72%] Building CXX object third_party/UHDM/CMakeFiles/uhdm-hier.dir/util/uhdm-hier.cpp.o
[ 72%] Built target GenerateCacheSerializers
[ 72%] Generating generated/src/parser/generated-listeners.tstamp, generated/include/Surelog/API/VObjectTypes_py.h, generated/include/Surelog/SourceCompile/ParseTreeListener.h, generated/include/Surelog/SourceCompile/ParseTreeTraceListener.h, generated/include/Surelog/SourceCompile/SV3_1aPpTreeShapeListener.h, generated/include/Surelog/SourceCompile/SV3_1aTreeShapeListener.h, generated/include/Surelog/SourceCompile/VObjectTypes.h, generated/src/SourceCompile/ParseTreeListener.cpp, generated/src/SourceCompile/VObjectTypes.cpp
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/API/Surelog.cpp.o
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/API/SLAPI.cpp.o
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/Cache/Cache.cpp.o
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/API/PythonAPI.cpp.o
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/Cache/PPCache.cpp.o
[ 73%] Building CXX object CMakeFiles/surelog.dir/src/Cache/ParseCache.cpp.o
[ 75%] Building CXX object CMakeFiles/surelog.dir/src/CommandLine/CommandLineParser.cpp.o
[ 75%] Building CXX object CMakeFiles/surelog.dir/src/Common/ClockingBlockHolder.cpp.o
[ 75%] Building CXX object CMakeFiles/surelog.dir/src/Common/FileSystem.cpp.o
[ 75%] Building CXX object CMakeFiles/surelog.dir/src/Common/PathId.cpp.o
[ 75%] Building CXX object CMakeFiles/surelog.dir/src/Common/PlatformFileSystem.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Config/Config.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Config/ConfigSet.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Design/DataType.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Design/DefParam.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Design/Design.cpp.o
[ 76%] Building CXX object CMakeFiles/surelog.dir/src/Design/BindStmt.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/DesignComponent.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/DesignElement.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/Enum.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/FileContent.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/Function.cpp.o
[ 77%] Building CXX object CMakeFiles/surelog.dir/src/Design/ModPort.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/ModuleDefinition.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/ModuleInstance.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/Netlist.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/Parameter.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/ParamAssign.cpp.o
[ 78%] Building CXX object CMakeFiles/surelog.dir/src/Design/Scope.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/Signal.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/SimpleType.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/DummyType.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/Statement.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/Struct.cpp.o
[ 79%] Building CXX object CMakeFiles/surelog.dir/src/Design/Task.cpp.o
[ 80%] Building CXX object CMakeFiles/surelog.dir/src/Design/TfPortItem.cpp.o
[ 80%] Building CXX object CMakeFiles/surelog.dir/src/Design/TimeInfo.cpp.o
[ 80%] Building CXX object CMakeFiles/surelog.dir/src/Design/Union.cpp.o
[ 80%] Building CXX object CMakeFiles/surelog.dir/src/Design/VObject.cpp.o
[ 80%] Linking CXX executable bin/uhdm-cmp
[ 80%] Building CXX object CMakeFiles/surelog.dir/src/Design/ValuedComponentI.cpp.o
[ 81%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/Builtin.cpp.o
[ 81%] Linking CXX executable bin/uhdm-hier
[ 81%] Built target uhdm-cmp
[ 81%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileAssertion.cpp.o
[ 82%] Linking CXX executable bin/uhdm-lint
[ 82%] Built target uhdm-hier
[ 82%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileClass.cpp.o
[ 82%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileDesign.cpp.o
[ 82%] Linking CXX executable bin/uhdm-dump
[ 82%] Built target uhdm-lint
[ 82%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompilerHarness.cpp.o
[ 82%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileExpression.cpp.o
[ 82%] Built target uhdm-dump
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileFileContent.cpp.o
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileHelper.cpp.o
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/EvalFunc.cpp.o
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileModule.cpp.o
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompilePackage.cpp.o
[ 84%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileProgram.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileStep.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileStmt.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileToolbox.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileType.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/CompileGenStmt.cpp.o
[ 85%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/DesignElaboration.cpp.o
[ 86%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/ElaborationStep.cpp.o
[ 86%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/NetlistElaboration.cpp.o
[ 86%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/ElaboratorHarness.cpp.o
[ 86%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/PackageAndRootElaboration.cpp.o
[ 86%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/ResolveSymbols.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/TestbenchElaboration.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/UVMElaboration.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/UhdmChecker.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/DesignCompile/UhdmWriter.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/Error.cpp.o
[ 87%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/ErrorContainer.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/ErrorDefinition.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/Location.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/LogListener.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/Report.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/ErrorReporting/Waiver.cpp.o
[ 88%] Building CXX object CMakeFiles/surelog.dir/src/Expression/ExprBuilder.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Expression/Value.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Library/AntlrLibParserErrorListener.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Library/Library.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Library/LibrarySet.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Library/ParseLibraryDef.cpp.o
[ 89%] Building CXX object CMakeFiles/surelog.dir/src/Library/SVLibShapeListener.cpp.o
[ 90%] Building CXX object CMakeFiles/surelog.dir/src/Package/Package.cpp.o
[ 90%] Building CXX object CMakeFiles/surelog.dir/src/Package/Precompiled.cpp.o
[ 90%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/AnalyzeFile.cpp.o
[ 90%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/AntlrParserErrorListener.cpp.o
[ 90%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/AntlrParserHandler.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/CheckCompile.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/CommonListenerHelper.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/CompilationUnit.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/CompileSourceFile.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/Compiler.cpp.o
[ 92%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/LoopCheck.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/MacroInfo.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/ParseFile.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/ParserHarness.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/PreprocessFile.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/PreprocessHarness.cpp.o
[ 93%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/SV3_1aPpTreeListenerHelper.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/SV3_1aPpTreeShapeListener.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/SV3_1aTreeShapeHelper.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/SourceCompile/SV3_1aTreeShapeListener.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/ClassDefinition.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/ClassObject.cpp.o
[ 94%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/FunctionMethod.cpp.o
[ 95%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/Program.cpp.o
[ 95%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/Property.cpp.o
[ 95%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/TaskMethod.cpp.o
[ 95%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/TypeDef.cpp.o
[ 95%] Building CXX object CMakeFiles/surelog.dir/src/Testbench/Variable.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/src/Utils/ParseUtils.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/src/Utils/StringUtils.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/src/Utils/NumUtils.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/src/Utils/Timer.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aLexer.cpp.o
[ 96%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aParserBaseListener.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aParser.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aParserListener.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aPpLexer.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aPpParserBaseListener.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aPpParser.cpp.o
[ 97%] Building CXX object CMakeFiles/surelog.dir/generated/src/parser/SV3_1aPpParserListener.cpp.o
[ 98%] Building CXX object CMakeFiles/surelog.dir/generated/src/SourceCompile/VObjectTypes.cpp.o
[ 98%] Building CXX object CMakeFiles/surelog.dir/generated/src/SourceCompile/ParseTreeListener.cpp.o
[ 98%] Linking CXX static library lib/libsurelog.a
[ 98%] Built target surelog
[ 98%] Building CXX object CMakeFiles/surelog-bin.dir/src/main.cpp.o
[ 98%] Building CXX object CMakeFiles/hellodesign.dir/src/hellodesign.cpp.o
[ 98%] Building CXX object CMakeFiles/hellouhdm.dir/src/hellouhdm.cpp.o
[ 98%] Building CXX object CMakeFiles/roundtrip.dir/src/roundtrip.cpp.o
[ 98%] Linking CXX executable bin/surelog
       Staging for precompiled packages ...
       ... staging completed.
[ 98%] Built target surelog-bin
[ 98%] Generating bin/pkg/work/ovm_pkg.sv.slpa
[ 98%] Generating bin/pkg/work/uvm_pkg.sv.slpa
       Creating OVM precompiled package...
       Creating UVM precompiled package...
[ 98%] Linking CXX executable bin/hellodesign
[ 98%] Built target hellodesign
[ 98%] Linking CXX executable bin/roundtrip
[ 98%] Built target roundtrip
[100%] Linking CXX executable bin/hellouhdm
       Package OVM created
[100%] Built target PrecompileOVM
[100%] Built target hellouhdm
       Package UVM created
[100%] Built target PrecompileUVM
[100%] Building CXX object CMakeFiles/hellosureworld.dir/src/hellosureworld.cpp.o
[100%] Linking CXX executable bin/hellosureworld
[100%] Built target hellosureworld
🧪 [8/8] 构建完成，验证版本...
VERSION: 1.84
BUILT  : Jul 22 2025
====================================================
🎉 安装完成！系统信息如下：
Linux orz 5.4.0-131-generic #147-Ubuntu SMP Fri Oct 14 17:07:22 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.5 LTS
Release:	20.04
Codename:	focal
====================================================
🧪 示例命令：解析你的 AES.v 文件（SystemVerilog）

  cd Surelog
  ./build/bin/surelog -parse -sverilog AES.v
====================================================
(base) hx@orz:~$ ls
Miniconda3-py38_4.12.0-Linux-x86_64.sh  Surelog  cmake-3.27.9-linux-x86_64.sh  install_surelog.sh  miniconda3
(base) hx@orz:~$ 
```
