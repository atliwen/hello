# 构建新的镜像  注意 .  不能少。
docker build -t registry.cn-hangzhou.aliyuncs.com/atliwen/elemenet:0.0.100 .;
# 登录 私有镜像仓库
#sudo  docker login  -u 用户名 -p 密码 hbt.zjs.com.cn;
docker login --username=18210051699 -p qq123123 registry.cn-hangzhou.aliyuncs.com
# 推送本地镜像到镜像厂库
# sudo  docker push 系统名称:版本号;

docker push registry.cn-hangzhou.aliyuncs.com/atliwen/elemenet:0.0.100
