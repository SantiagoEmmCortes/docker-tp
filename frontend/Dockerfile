FROM nginx:alpine

# Reemplaza la configuración default de Nginx por la nuestra
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia los archivos estáticos a la carpeta que Nginx sirve
COPY html/ /usr/share/nginx/html/

EXPOSE 80