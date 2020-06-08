#FROM nginx:latest
# 设置时区为上海
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 描述
#MAINTAINER atliwen
# 打包文采后的路径
#COPY dist  /usr/share/nginx/html/

FROM node:12-alpine3.10  as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm config set registry http://registry.npm.taobao.org/
RUN npm install
# 拷贝 当前目录下所有文件到 容器 /app目录下
COPY . .
# 运行的构建命令  
RUN npm run build
# production stage
FROM nginx:latest as production-stage
# 设置时区为上海
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 文件路径 设置正确地址    /app 为根路径 
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
