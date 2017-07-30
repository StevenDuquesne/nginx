FROM nginx:latest

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]