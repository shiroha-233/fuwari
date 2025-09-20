@echo off
chcp 65001 >nul
echo 🚀 开始部署 Fuwari 博客到 Cloudflare Pages...

REM 检查是否在 Git 仓库中
if not exist ".git" (
    echo ❌ 错误: 当前目录不是 Git 仓库
    echo 请先初始化 Git 仓库:
    echo git init
    echo git remote add origin ^<your-repo-url^>
    pause
    exit /b 1
)

REM 检查是否有未提交的更改
git status --porcelain >nul 2>&1
if %errorlevel% equ 0 (
    echo 📝 发现未提交的更改，正在提交...
    git add .
    set /p commit_message="请输入提交信息 (默认: 'Deploy to Cloudflare Pages'): "
    if "%commit_message%"=="" set commit_message=Deploy to Cloudflare Pages
    git commit -m "%commit_message%"
)

REM 推送到远程仓库
echo 📤 推送代码到 GitHub...
git push origin main || git push origin master

echo ✅ 代码已推送到 GitHub
echo 🔄 GitHub Actions 将自动构建和部署到 Cloudflare Pages
echo.
echo 📊 您可以在以下位置查看部署状态:
echo    • GitHub Actions: 在您的 GitHub 仓库的 Actions 标签页
echo    • Cloudflare Pages: https://dash.cloudflare.com/pages
echo.
echo 🎉 部署完成！请等待几分钟让构建完成。
pause