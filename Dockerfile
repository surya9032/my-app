FROM nginx
RUN apt update
RUN apt install nginx
EXPOSE 80

