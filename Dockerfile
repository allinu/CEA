FROM node:lts-alpine

# change timezone and install packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories 

RUN apk add --update tzdata dcron \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && npm i -g cea 

WORKDIR /app

COPY . .

RUN rm -f /var/spool/cron/crontabs/root \
    && chmod +x entrypoint.sh \
    && cp entrypoint.sh /usr/local/bin/entrypoint

WORKDIR /

VOLUME [ "/app/conf" ]

CMD [ "entrypoint" ]
