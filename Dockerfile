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
   
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
 COPY . /app   
 RUN cd /app && \
     yarn install && \
     yarn dev 


 
RUN chmod +x /app/start.sh && \
    
CMD ["/app/start.sh"]
