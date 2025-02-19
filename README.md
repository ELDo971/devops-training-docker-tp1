# devops-training-docker-tp1

# Question 3
## Prérequis
- Docker installé sur votre machine

## 1. Récupérer l'image Nginx depuis Docker Hub
```bash
docker pull nginx
```

## 2. Vérifier que l'image est bien présente en local
```bash
docker images
```

## 3. Créer un fichier `index.html`
```bash
mkdir -p ./html
echo "Hello World" > ./html/index.html
```

## 4. Démarrer un container et servir la page HTML avec un montage de volume
```bash
docker run -d --name myservnginx -p 80:80 -v $(pwd)/html:/usr/share/nginx/html nginx
```

## 5. Supprimer le container
```bash
docker stop myservnginx
docker rm myservnginx
```

## 6. Relancer le container sans l'option `-v` et copier le fichier manuellement
```bash
docker run -d --name myservnginx -p 80:80 nginx
docker cp ./html/index.html myservnginx:/usr/share/nginx/html/index.html
```

## 7. Accéder au serveur
Ouvrez un navigateur et allez à l'adresse suivante :
```
http://localhost/
```

# Question 4

## 1. Créer un Dockerfile

```bash
# Utiliser l'image de base Nginx
FROM nginx

# Copier le fichier index.html dans le répertoire de Nginx
COPY ./html/index.html /usr/share/nginx/html/index.html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
```

## 2.Construire l'image Docker

```bash
docker build -t my-nginxserv .
```

## 3. Exécuter un container basé sur cette image
```bash
docker run -d --name mon-serveur -p 8080:80 my-nginxserv
```

# Question 5

## 1. Récupérer les images depuis Docker Hub
``` bash
docker pull mysql:latest
docker pull phpmyadmin/phpmyadmin:latest
```

## 2. Créer un réseau Docker
``` bash
docker network create mynetwork
```
## 3. Lancer le container MySQL
``` bash
docker run -d --name my-mysql \
  --network mynetwork \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=mydb \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=password \
  mysql:latest
```

## 4. Lancer le container phpmyadmin
``` bash
docker run -d --name my-phpmyadmin \
  --network mynetwork \
  -e PMA_HOST=my-mysql \
  -p 8081:80 \
  phpmyadmin/phpmyadmin:latest
```

# Question 6

## 1. docker-compose vs docker run

    docker run est utilisé pour exécuter un conteneur unique à partir d'une image.
    docker-compose permet de définir et gérer plusieurs conteneurs dans un fichier docker-compose.yml

## 2. Lancer les containers du fichier yaml

``` bash
docker-compose up -d
```

## 3. Stopper les containers du fichier yaml
``` bash
docker-compose down
```
