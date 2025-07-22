#!/bin/bash

set -e

echo "===================================================="
echo "🛠️  Surelog 一键安装脚本（共 8 步）"
echo "🚀  开始安装，请确保联网，并具有 sudo 权限"
echo "🌐 本脚本将配置 Git 和终端代理（HTTP + SOCKS5）"
echo "===================================================="

# [1/8] 设置代理
echo "🌐 [1/8] 配置 Git 和 Shell 全局代理"
read -p "请输入代理 IP（例如 192.168.1.218）: " proxy_ip
read -p "请输入代理端口（例如 7890）: " proxy_port

proxy_http="http://${proxy_ip}:${proxy_port}"
proxy_socks5="socks5://${proxy_ip}:${proxy_port}"

# 设置 Git 代理
echo "🔧 配置 Git 全局代理..."
git config --global http.proxy "$proxy_http"
git config --global https.proxy "$proxy_http"
git config --global sock.proxy "$proxy_socks5"  

# 设置 shell 环境变量代理
echo "🔧 配置当前终端环境变量代理..."
export http_proxy="$proxy_http"
export https_proxy="$proxy_http"
export all_proxy="$proxy_socks5"

echo "🌐 正在测试代理是否生效..."
echo "🔍 使用 curl 获取 IP 地址（来自 ipinfo.io）："
curl -s ipinfo.io || echo "❌ 无法通过 curl 获取 IP，请检查代理"

echo
echo "🔍 当前 Git 代理配置如下："
echo "  http.proxy   = $(git config --global --get http.proxy)"
echo "  https.proxy  = $(git config --global --get https.proxy)"
echo "  sock.proxy   = $(git config --global --get sock.proxy)"

echo
read -p "✅ 如果上述代理配置和 IP 信息正确，输入 y 继续安装，其他键退出: " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "❌ 安装中止，未检测到 y 确认"
    exit 1
fi

echo "🔧 [2/8] 安装系统依赖..."
sudo apt update
sudo apt install -y build-essential curl git python3-pip libgoogle-perftools-dev zlib1g-dev libjemalloc-dev openjdk-11-jdk

echo "🐍 [3/8] 安装 Python 包..."
pip3 install --upgrade pip
pip3 install orderedmultidict

echo "🔨 [4/8] 安装 CMake 3.27.9 到 /opt/cmake..."
cd ~
CMAKE_VER=3.27.9
CMAKE_SH=cmake-${CMAKE_VER}-linux-x86_64.sh
wget -nc https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}/${CMAKE_SH}
sudo mkdir -p /opt/cmake
sudo sh ${CMAKE_SH} --prefix=/opt/cmake --skip-license
sudo ln -sf /opt/cmake/bin/cmake /usr/local/bin/cmake
hash -r
echo "✅ CMake 安装完成: $(cmake --version | head -n 1)"

echo "📥 [5/8] 克隆 Surelog 仓库及子模块..."
git clone https://github.com/chipsalliance/Surelog.git
cd Surelog
git submodule update --init --recursive

echo "⚙️ [6/8] 使用 CMake 配置项目..."
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF -S . -B build

echo "🧱 [7/8] 编译 Surelog 中（可能需要几分钟）..."
cmake --build build -j$(nproc)

echo "🧪 [8/8] 构建完成，验证版本..."
./build/bin/surelog --version

echo "===================================================="
echo "🎉 安装完成！系统信息如下："
uname -a
lsb_release -a 2>/dev/null || cat /etc/os-release || echo "（系统版本信息未检测到）"
echo "===================================================="
echo "🧪 示例命令：解析你的 AES.v 文件（SystemVerilog）"
echo
echo "  cd Surelog"
echo "  ./build/bin/surelog -parse -sverilog AES.v"
echo "===================================================="
