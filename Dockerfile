# Railway 部署 Dockerfile - CraftVerse MC Server Website
FROM node:20-alpine

WORKDIR /app

# 复制后端依赖配置
COPY backend/package.json backend/package-lock.json* ./backend/

# 安装后端依赖
RUN cd backend && npm install --production

# 复制所有文件
COPY . .

# 设置环境变量
ENV PORT=3000
ENV NODE_ENV=production

# 暴露端口
EXPOSE 3000

# 启动
CMD ["node", "backend/server.js"]
