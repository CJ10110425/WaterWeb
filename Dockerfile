# 使用官方 Node.js 基础镜像
FROM node:latest

# 设置工作目录为 /app
WORKDIR /app

# 复制 package.json 和 package-lock.json (如果存在)
COPY package*.json ./

# 安装项目依赖，包括 serve
RUN npm install

# 复制项目文件到工作目录
COPY . .

# 定义环境变量，指定 serve 提供静态文件的目录
# 由于静态文件位于根目录，这里应该是 '.'
ENV SERVE_PATH=.

# 容器启动时执行 serve 来启动静态文件服务器
CMD ["npx", "serve", "-s", "/app", "-l", "tcp://0.0.0.0:8080"]

