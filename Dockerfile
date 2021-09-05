FROM nginx:alpine


WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY ./* ./
EXPOSE 80


#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]


HEALTHCHECK --interval=2s --timeout=5s --retries=5 CMD curl -f http://localhost:80/ || exit 1
