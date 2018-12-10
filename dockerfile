FROM nginx
# 定义作者
MAINTAINER hailong.chen
# 将dist文件中的内容复制到 /usr/share/nginx/html/ 这个目录下面
COPY public/  /usr/share/nginx/html/
