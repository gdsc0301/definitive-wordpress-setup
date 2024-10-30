tar cvzf deploy.tar.gz compose.yml Dockerfile additional-php-rules.ini nginx-prod wp-content

# Copy the files to the server via SSH
FOLDER="marketing-website"
ADDRESS="root@$SERVER_IP:/root/$FOLDER"

# Remove the current files
# Create the folders to prevent errors
ssh root@$SERVER_IP "
    cd /root/$FOLDER &&
    docker compose down -v &&
    docker compose rm -fv &&
    cd .. &&
    rm -R $FOLDER &&
    mkdir -p $FOLDER
"

# Copy the files to the server via SCP
scp deploy.tar.gz $ADDRESS

# Extract the files from the tar.gz
ssh root@$SERVER_IP "cd /root/$FOLDER && tar xvzf deploy.tar.gz"

# Change the ownership of the files to the www-data user
ssh root@$SERVER_IP "chown -R www-data:www-data /root/$FOLDER"

# Run the compose file
ssh root@$SERVER_IP "cd /root/$FOLDER && docker compose up -d --build"