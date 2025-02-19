# Utiliser l'image de base Nginx
FROM nginx

# Copier le fichier index.html dans le répertoire de Nginx
COPY ./html/index.html /usr/share/nginx/html/index.html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
