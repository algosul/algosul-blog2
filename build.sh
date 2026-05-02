#!/bin/bash

# 零号种子项目构建脚本
# 用于 GitHub Pages 部署

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   零号种子 - 构建脚本${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# 创建输出目录
OUTPUT_DIR="dist"
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# 复制静态资源
echo -e "${YELLOW}📦 复制静态资源...${NC}"
if [ -d "零号种子" ]; then
  cp -r 零号种子/* "$OUTPUT_DIR/"
  echo -e "${GREEN}✓ 静态资源复制完成${NC}"
else
  echo -e "${RED}✗ 错误：零号种子目录不存在${NC}"
  exit 1
fi

# 复制入口文件
echo -e "${YELLOW}📄 复制入口文件...${NC}"
cp index.html "$OUTPUT_DIR/"
echo -e "${GREEN}✓ 入口文件复制完成${NC}"

# 创建 .nojekyll 文件（防止 GitHub Pages 使用 Jekyll）
touch "$OUTPUT_DIR/.nojekyll"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   构建完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "输出目录: ${YELLOW}$OUTPUT_DIR${NC}"
echo -e "部署到 GitHub Pages: ${YELLOW}推送到 main 分支的 docs/ 或根目录${NC}"
