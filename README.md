# Algosul Blog

Cloudflare Workers Rust 后端项目。

## 本地开发

```bash
npm install
cargo install worker-build
npm run dev
```

默认本地地址为 `http://localhost:8787`。

## 构建验证

```bash
npm run build
```

## 发布

```bash
npm run deploy
```

首次发布前需要登录 Cloudflare：

```bash
npx wrangler login
```

## 路由

- `GET /`：网站首页
- `GET /api/health`：后端健康检查
