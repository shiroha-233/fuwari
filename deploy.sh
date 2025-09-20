#!/bin/bash

# Fuwari 博客 Cloudflare Pages 部署脚本

echo "🚀 开始部署 Fuwari 博客到 Cloudflare Pages..."

# 检查是否在 Git 仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误: 当前目录不是 Git 仓库"
    echo "请先初始化 Git 仓库:"
    echo "git init"
    echo "git remote add origin <your-repo-url>"
    exit 1
fi

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 发现未提交的更改，正在提交..."
    git add .
    read -p "请输入提交信息 (默认: 'Deploy to Cloudflare Pages'): " commit_message
    commit_message=${commit_message:-"Deploy to Cloudflare Pages"}
    git commit -m "$commit_message"
fi

# 推送到远程仓库
echo "📤 推送代码到 GitHub..."
git push origin main || git push origin master

echo "✅ 代码已推送到 GitHub"
echo "🔄 GitHub Actions 将自动构建和部署到 Cloudflare Pages"
echo ""
echo "📊 您可以在以下位置查看部署状态:"
echo "   • GitHub Actions: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/actions"
echo "   • Cloudflare Pages: https://dash.cloudflare.com/pages"
echo ""
echo "🎉 部署完成！请等待几分钟让构建完成。"