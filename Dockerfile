FROM devisty/xssh:v2

# 暴露端口
EXPOSE 8080
EXPOSE 80

# 更新并安装依赖
RUN apt-get update && \
    apt-get install -y git curl net-tools && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 将应用复制到容器
COPY . /app 

# 安装应用依赖
RUN cd /app && \
    cp /app/default.conf /etc/nginx/conf.d/default.conf && \
    yarn install 

# 使启动脚本可执行
RUN chmod +x /app/start.sh

# 将启动脚本设置为默认命令
CMD ["/app/start.sh"]

# 运行 yarn dev
WORKDIR /app
RUN yarn dev
