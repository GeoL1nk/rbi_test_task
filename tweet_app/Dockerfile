FROM nginx:latest

COPY webapp-nginx.conf /etc/nginx/nginx.conf
COPY index-new.html /usr/share/nginx/html/index.html
COPY linux.png /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
