FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/default.conf

COPY default.conf.template /etc/nginx/templates/default.conf.template

ENV PORT=8080
ENV NGINX_ENVSUBST_FILTER='^(PORT|UPSTREAM_URL|NGINX_LOCAL_RESOLVERS)$'
