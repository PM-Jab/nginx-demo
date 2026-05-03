FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/default.conf

COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY 25-substitute-resolvers.sh /docker-entrypoint.d/25-substitute-resolvers.sh
RUN chmod +x /docker-entrypoint.d/25-substitute-resolvers.sh

ENV PORT=8080
ENV NGINX_ENVSUBST_FILTER='^(PORT|UPSTREAM_URL)$'
