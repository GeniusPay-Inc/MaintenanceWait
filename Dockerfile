# Rebuild sécurité 2026-11 : images figées par tag + digest (node 22.23.4, nginx 1.30.6).
FROM nginx:1.30.6-alpine3.24@sha256:0e52bd054126cdc040b1276c0af347aeb02a41b9cfe305d6094767ac30e97949
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY maintenance.html maintenance.json /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
EXPOSE 80
HEALTHCHECK CMD wget -qO- http://127.0.0.1/health || exit 1
