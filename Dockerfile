FROM nginx:latest
RUN sed -i 's/nginx/bass/g' /usr/share/nginx/html/index.html
EXPOSE 80
