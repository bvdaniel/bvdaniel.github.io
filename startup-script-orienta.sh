//llama variables
NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone)
MACHINETYPE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/machine-type)
PROJECTID=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id) 

//descarga repo

sudo apt-get update
sudo apt-get install git
git clone https://github.com/bvdaniel/orienta_web.git

//instala nginx
cd
sudo apt install nginx -y
//Install php
sudo apt-get install php
sudo apt-get install ufw
sudo ufw enable
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw allow 'Nginx Full'
sudo rm /etc/nginx/sites-enabled/default
sudo cp -R ./ /var/www/
sudo chown -R $USER:$USER /var/www/orienta_web 
sudo chown -R $USER:$USER /etc/nginx/sites-available/

// Crea el archivo del server con la info que nos importa
sudo cat <<EOF> /etc/nginx/sites-available/orienta_web
server{
listen 80;
listen [::]:80;
root /var/www/orienta_web;
index index.html index.php;
server_name orienta-webserver;
location / {
try_files $uri $uri/ =404;
}
location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
}
location ~ /\.ht {
        deny all;
}
}
EOF

//No hay que agregar el host a /etc/nginx/hosts pues GCP lo agrega solo
//Crea el link simbólico de available a enabled:

sudo ln -s /etc/nginx/sites-available/orienta_web /etc/nginx/sites-enabled/orienta_web
sudo systemctl restart nginx
