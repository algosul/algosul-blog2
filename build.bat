@echo off
REM 零号种子项目构建脚本 - Windows 版本

echo ========================================
echo    零号种子 - 构建脚本
echo ========================================
echo.

REM 创建输出目录
if exist dist rmdir /s /q dist
mkdir dist

REM 复制静态资源
echo [INFO] 正在复制静态资源...
if exist "零号种子" (
  xcopy /E /I /Y "零号种子" "dist\"
  echo [OK] 静态资源复制完成
) else (
  echo [ERROR] 错误：零号种子目录不存在
  exit /b 1
)

REM 复制入口文件
echo [INFO] 正在复制入口文件...
copy index.html dist\
echo [OK] 入口文件复制完成

REM 创建 .nojekyll 文件
echo. > dist\.nojekyll

echo.
echo ========================================
echo    构建完成！
echo ========================================
echo.
echo 输出目录: dist
echo 部署到 GitHub Pages: 推送到 main 分支的 docs/ 或根目录
