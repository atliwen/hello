FROM nginx:latest
# 设置时区为上海
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 描述
MAINTAINER atliwen
# 打包文采后的路径
COPY dist  /usr/share/nginx/html/
