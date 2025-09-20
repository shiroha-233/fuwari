# 🚀 Cloudflare Pages 部署指南

本指南将帮助您将 Fuwari 博客通过 GitHub 部署到 Cloudflare Pages。

## 📋 部署步骤

### 1. 准备 GitHub 仓库

确保您的代码已经推送到 GitHub 仓库：

```bash
git add .
git commit -m "准备部署到 Cloudflare Pages"
git push origin main
```

### 2. 获取 Cloudflare 凭据

#### 2.1 获取 Account ID
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 在右侧边栏找到 **Account ID**，复制保存

#### 2.2 创建 API Token
1. 访问 [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
2. 点击 **Create Token**
3. 选择 **Custom token** 模板
4. 配置权限：
   - **Account** - `Cloudflare Pages:Edit`
   - **Zone** - `Zone:Read` (如果使用自定义域名)
5. 点击 **Continue to summary** → **Create Token**
6. 复制生成的 Token

### 3. 配置 GitHub Secrets

在您的 GitHub 仓库中设置 Secrets：

1. 进入仓库 → **Settings** → **Secrets and variables** → **Actions**
2. 点击 **New repository secret**
3. 添加以下 Secrets：

```
CLOUDFLARE_API_TOKEN=your_api_token_here
CLOUDFLARE_ACCOUNT_ID=your_account_id_here
```

### 4. 创建 Cloudflare Pages 项目

#### 方法一：通过 Cloudflare Dashboard（推荐）

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 点击 **Pages** → **Create a project**
3. 选择 **Connect to Git**
4. 选择您的 GitHub 仓库
5. 配置构建设置：
   - **Framework preset**: `Astro`
   - **Build command**: `pnpm run build`
   - **Build output directory**: `dist`
   - **Root directory**: `/` (保持默认)
   - **Node.js version**: `18`

#### 方法二：通过 GitHub Actions 自动创建

推送代码后，GitHub Actions 会自动创建项目并部署。

### 5. 环境变量配置（如需要）

如果您的项目需要环境变量：

1. 在 Cloudflare Pages 项目中
2. 进入 **Settings** → **Environment variables**
3. 添加所需的环境变量

### 6. 自定义域名（可选）

如果您有自定义域名：

1. 在 Cloudflare Pages 项目中
2. 进入 **Custom domains**
3. 点击 **Set up a custom domain**
4. 输入您的域名并按照指引配置 DNS

## 🔧 配置文件说明

### `.github/workflows/deploy.yml`
- GitHub Actions 工作流配置
- 自动构建和部署到 Cloudflare Pages
- 支持 Pull Request 预览

### `wrangler.toml`
- Cloudflare Workers/Pages 配置文件
- 定义项目名称和构建设置

### `_headers`
- HTTP 头部配置
- 安全策略和缓存控制

### `_redirects`
- URL 重定向规则
- HTTPS 强制跳转

## 🚀 部署流程

1. **推送代码** → GitHub 仓库
2. **触发 Actions** → 自动构建
3. **部署到 Cloudflare** → 生成预览链接
4. **访问网站** → 通过 Cloudflare Pages URL

## 📊 部署状态检查

### GitHub Actions
- 访问仓库的 **Actions** 标签页
- 查看构建和部署状态

### Cloudflare Pages
- 登录 Cloudflare Dashboard
- 进入 **Pages** → 您的项目
- 查看部署历史和状态

## 🔍 常见问题

### Q: 构建失败怎么办？
A: 检查 GitHub Actions 日志，通常是依赖安装或构建命令问题。

### Q: 部署成功但网站无法访问？
A: 检查 Cloudflare Pages 的部署状态和自定义域名配置。

### Q: 如何更新网站内容？
A: 直接推送代码到 GitHub，会自动触发重新部署。

### Q: 如何回滚到之前的版本？
A: 在 Cloudflare Pages 的部署历史中选择之前的版本进行回滚。

## 🎯 优化建议

1. **启用缓存** - 已在 `_headers` 中配置
2. **压缩资源** - Cloudflare 自动处理
3. **CDN 加速** - Cloudflare 全球 CDN
4. **HTTPS** - 自动启用 SSL/TLS

## 📞 支持

如果遇到问题：
1. 查看 [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
2. 检查 [Astro 部署指南](https://docs.astro.build/en/guides/deploy/cloudflare/)
3. 查看 GitHub Actions 构建日志

---

🎉 **恭喜！您的 Fuwari 博客现在已经部署到 Cloudflare Pages 了！**