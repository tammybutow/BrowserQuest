FROM node:10
ENV NODE_ENV production
RUN wget http://download.redis.io/redis-stable.tar.gz && \
    tar xvzf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    mv src/redis-server /usr/bin/ && \
    cd .. && \
    rm -r redis-stable && \
    npm install -g concurrently   
EXPOSE 6379
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
EXPOSE 8000
EXPOSE 6379
CMD concurrently "/usr/bin/redis-server --bind '0.0.0.0'" "sleep 5s; node /app/src/server.js" 