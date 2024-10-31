# Zip the files and ignore node_modules
tar \
  --exclude='./wp-content/themes/twentytwentytwo' \
  --exclude='./wp-content/themes/twentytwentythree' \
  --exclude='./wp-content/themes/twentytwentyfour' \
  --exclude='./wp-content/themes/my-custom-theme/node_modules' \
  -cvzf \
  deploy.tar.gz \
  compose.yml \
  Dockerfile \
  additional-php-rules.ini \
  nginx-prod \
  wp-content

# Copy the files to the server via SSH
FOLDER="website"
ADDRESS="root@$SERVER_IP:/root"

# Copy the bootstrap script to the server, don't ask any questions
scp bootstrap.sh $ADDRESS
ssh root@$SERVER_IP "chmod +x bootstrap.sh"

# Run the bootstrap script
ssh root@$SERVER_IP "FOLDER=$FOLDER ./bootstrap.sh"

# Copy the files to the server via SCP
scp deploy.tar.gz $ADDRESS/$FOLDER

# Extract the files from the tar.gz
ssh root@$SERVER_IP "cd $FOLDER && tar xvzf deploy.tar.gz"

# Change the ownership of the files to the www-data user
ssh root@$SERVER_IP "chown -R www-data:www-data $FOLDER"

# Run the compose file
ssh root@$SERVER_IP "cd $FOLDER && docker compose up -d --build"