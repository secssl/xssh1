FROM devisty/xssh:v2
EXPOSE 8080
EXPOSE 80
RUN apt-get update && \
    apt-get install -y git curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y net-tools  && \
    apt-get clean && \
    
    #git clone https://github.com/xugaoyi/vuepress-theme-vdoing.git && \
    #cd vuepress-theme-vdoing && \
    npm install -g yarn && \
     #yarn install && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    


COPY . /app
RUN chmod +x /app/start.sh && \
    chmod +x /app/deploy.sh && \
    npm run deploy && \
CMD ["/app/start.sh"]
