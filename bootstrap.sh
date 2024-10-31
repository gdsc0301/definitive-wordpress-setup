if [ -d "$FOLDER" ]; then
  cd $FOLDER
  # Stop all the containers on compose.yml
  docker stop -fv $(docker ps -a -q)
  # Remove all the containers on compose.yml
  docker rm -fv $(docker ps -a -q)
  cd ..
fi

rm -R $FOLDER
mkdir -p $FOLDER

if [ ! -a ".env" ]; then
  touch .env 
  echo "WORDPRESS_AUTH_KEY=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_SECURE_AUTH_KEY=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_LOGGED_IN_KEY=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_NONCE_KEY=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_AUTH_SALT=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_SECURE_AUTH_SALT=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_LOGGED_IN_SALT=$(openssl rand -hex 32)" >> .env
  echo "WORDPRESS_NONCE_SALT=$(openssl rand -hex 32)" >> .env
fi

cp .env $FOLDER/.env