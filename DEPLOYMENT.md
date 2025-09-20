# Cloudflare Pages 部署指南

本项目已配置为通过 GitHub Actions 自动部署到 Cloudflare Pages。

## 设置步骤

### 1. 在 Cloudflare 中创建 Pages 项目

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 进入 **Pages** 部分
3. 点击 **Create a project**
4. 选择 **Connect to Git**
5. 选择你的 GitHub 仓库
6. 配置构建设置：
   - **Framework preset**: Astro
   - **Build command**: `pnpm run build`
   - **Build output directory**: `dist`
   - **Root directory**: `/` (默认)

### 2. 获取必要的 API 信息

#### 获取 Cloudflare API Token
1. 进入 [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
2. 点击 **Create Token**
3. 使用 **Custom token** 模板
4. 设置权限：
   - **Account** - `Cloudflare Pages:Edit`
   - **Zone** - `Zone:Read` (如果使用自定义域名)
5. 复制生成的 token

#### 获取 Account ID
1. 在 Cloudflare Dashboard 右侧边栏找到 **Account ID**
2. 复制该 ID

#### 获取 Project Name
- 这是你在 Cloudflare Pages 中创建的项目名称

### 3. 在 GitHub 中设置 Secrets

1. 进入你的 GitHub 仓库
2. 点击 **Settings** > **Secrets and variables** > **Actions**
3. 添加以下 Repository secrets：

```
CLOUDFLARE_API_TOKEN=你的API令牌
CLOUDFLARE_ACCOUNT_ID=你的账户ID
CLOUDFLARE_PROJECT_NAME=你的项目名称
```

### 4. 配置自定义域名（可选）

如果你有自定义域名：

1. 在 `wrangler.toml` 中更新域名：
```toml
[env.production]
route = { pattern = "*", zone_name = "your-domain.com" }
```

2. 在 `astro.config.mjs` 中更新站点 URL：
```js
export default defineConfig({
  site: "https://your-domain.com/",
  // ...
});
```

3. 在 Cloudflare Pages 项目设置中添加自定义域名

## 部署流程

### 自动部署
- 推送到 `main` 或 `master` 分支时自动触发部署
- Pull Request 时会创建预览部署

### 手动部署
你也可以在 GitHub Actions 页面手动触发部署。

## 构建配置

项目使用以下构建配置：
- **包管理器**: pnpm 9.14.4
- **Node.js**: 20
- **构建命令**: `pnpm run build`
- **输出目录**: `dist`

## 故障排除

### 常见问题

1. **构建失败**
   - 检查 `package.json` 中的依赖版本
   - 确保所有必要的环境变量已设置

2. **部署失败**
   - 验证 Cloudflare API Token 权限
   - 检查 Account ID 和 Project Name 是否正确

3. **页面无法访问**
   - 检查 `astro.config.mjs` 中的 `site` 配置
   - 确认自定义域名 DNS 设置正确

### 查看日志
- GitHub Actions 日志：仓库的 **Actions** 标签页
- Cloudflare Pages 日志：Cloudflare Dashboard > Pages > 你的项目

## 性能优化

Cloudflare Pages 提供：
- 全球 CDN 分发
- 自动 HTTPS
- 无限带宽
- 边缘计算支持

你的 Astro 站点将自动享受这些性能优化。