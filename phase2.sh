#!/bin/bash

clear
echo -e "╔════════════════════════════════════════╗"
echo -e "║      🚀  EthStorage可信设置仪式 🚀       ║"
echo -e "║  👤    脚本编写：@qiyan|Bird🕊️           ║"
echo -e "║  📢  推特：https://x.com/garciaisabel60  ║"
echo -e "╚════════════════════════════════════════╝"
echo ""
echo -e "请选择操作："
echo "1. 安装并运行 Ceremony (screen 后台)"
echo "2. 查看 Ceremony 运行状态"
echo "3. 重新连接到 Ceremony 会话"
echo "4. 停止 Ceremony 会话"
echo "5. 退出脚本"
echo ""

read -p "请输入选项 [1-5]: " choice

case $choice in
    1)
        echo ">>> 创建 screen 会话并运行 ceremony..."
        screen -dmS phase bash -c '
        # 安装 nvm
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
        source ~/.bashrc

        # 安装并使用 Node.js 18
        nvm install 18
        nvm use 18

        # 创建临时目录
        mkdir -p ~/trusted-setup-tmp && cd ~/trusted-setup-tmp

        # 安装 Phase2 CLI
        npm install -g @p0tion/phase2cli

        # GitHub 身份验证
        echo ">>> 现在开始 GitHub 认证，请根据提示在浏览器登录并授权..."
        phase2cli auth

        # 开始贡献
        phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony

        # 完成后清理
        phase2cli clean
        phase2cli logout
        rm -rf ~/trusted-setup-tmp
        '
        echo ">>> Ceremony 已在后台运行，使用 'screen -r phase2' 查看进度"
        ;;
    2)
        screen -ls
        ;;
    3)
        screen -r phase
        ;;
    4)
        screen -S phase -X quit
        echo ">>> Ceremony 会话已停止"
        ;;
    5)
        echo "退出脚本..."
        exit 0
        ;;
    *)
        echo "无效选项"
        ;;
esac
