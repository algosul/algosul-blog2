# 零号种子 (Zero Seed)

一个运行在 GitHub Pages 上的沉浸式 WebGL 游戏体验项目。

## 项目特点

- **静态网站部署**：使用 GitHub Pages 部署，简单高效
- **WebGL 游戏**：完整的 WebGL 3D 游戏体验
- **PWA 支持**：支持离线访问和安装到桌面
- **响应式设计**：适配各种设备尺寸

## 快速开始

### 本地预览

```bash
# 克隆项目
git clone <your-repo-url>
cd algosul-blog2

# 构建项目
npm run build

# 使用任意 HTTP 服务器预览（Python 3）
python3 -m http.server 8000

# 或者使用 Node.js http-server
npx http-server dist -p 8000

# 访问 http://localhost:8000
```

### 构建项目

```bash
# Linux/macOS
npm run build

# Windows
npm run build:win
```

构建完成后，静态文件将在 `dist/` 目录中。

## GitHub Pages 部署

### 方式一：部署到主分支

1. 确保你的仓库有 `main`（或 `master`）分支
2. 构建项目：`npm run build`
3. 将 `dist/` 目录下的所有文件复制到仓库根目录
4. 提交并推送：
   ```bash
   git add .
   git commit -m "deploy: update site"
   git push origin main
   ```

### 方式二：部署到 docs 分支（推荐）

1. 在仓库设置中启用 GitHub Pages
2. 选择 `docs` 作为源分支
3. 构建项目：`npm run build`
4. 将 `dist/` 目录下的所有文件复制到仓库的 `docs/` 目录
5. 提交并推送：
   ```bash
   git add .
   git commit -m "deploy: update site"
   git push origin main
   ```

### 自动部署（可选）

使用 GitHub Actions 实现自动部署：

1. 创建 `.github/workflows/deploy.yml`：
   ```yaml
   name: Deploy to GitHub Pages

   on:
     push:
       branches: [main]

   permissions:
     contents: read
     pages: write
     id-token: write

   jobs:
     build-and-deploy:
       runs-on: ubuntu-latest
       steps:
         - name: Checkout
           uses: actions/checkout@v4

         - name: Setup Node.js
           uses: actions/setup-node@v4
           with:
             node-version: '20'

         - name: Build
           run: npm run build

         - name: Upload artifact
           uses: actions/upload-pages-artifact@v3
           with:
             path: 'dist'

         - name: Deploy to GitHub Pages
           uses: actions/deploy-pages@v4
   ```

2. 启用 GitHub Pages：
   - 进入仓库 Settings → Pages
   - Build and deployment → Source 选择 "GitHub Actions"
   - 保存设置

## 项目结构

```
algosul-blog2/
├── build.sh           # Linux/macOS 构建脚本
├── build.bat          # Windows 构建脚本
├── index.html         # 入口页面
├── package.json       # 项目配置
├── Cargo.toml         # Rust 项目配置
├── src/
│   └── lib.rs         # Rust 源码（已简化）
├── 零号种子/          # 游戏静态资源
├── dist/              # 构建输出目录（不提交）
└── .gitignore         # Git 忽略配置
```

## 游戏文件说明

游戏文件位于 `零号种子/` 目录，包括：
- `game.html` - 游戏主页面
- `game.js` - 游戏脚本
- `game.wasm` - WebAssembly 游戏逻辑
- `game.pck` - 资源包
- 其他图标、manifest 等静态资源

## 技术栈

- **HTML5/CSS3** - 网页界面
- **WebGL** - 3D 渲染
- **WebAssembly** - 游戏核心逻辑
- **Vite/PWA** - 构建工具（可选）

## 开发计划

- [ ] 添加更多游戏关卡
- [ ] 优化性能
- [ ] 支持多语言
- [ ] 添加成就系统

## 许可证

MIT License

---

**零号种子 (Zero Seed)** - 探索数字世界的边界 ฅ'ω'ฅ
