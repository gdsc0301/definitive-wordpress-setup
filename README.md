# The definitive WordPress setup

This is a WordPress installation that is designed to be as close to the
definitive setup as possible.

The goal is to have a WordPress installation that is plug-and-play.
It's not a WordPress theme, it's a WordPress installation.

## Server Requirements
- Any recent Ubuntu version
- 2GB of RAM
- 1GB of free disk space
- An IPv4 address
- Internet access
- SSH access

## The Server
There are many ways to get a server

I usually use [Hetzner Cloud](https://www.hetzner.com/). It's cheap, fast, reliable, and easy to use.
You can get a server for €4/month.

## Step 1
### Download this repository to your local machine.

- Click in the green button over here "Clone or download" and download the ZIP file.
- Extract the ZIP file to your local machine.

## Step 2
### Install Docker on your server
- Access your server via SSH
- Run the following commands:
``` bash
 curl -fsSL https://get.docker.com -o get-docker.sh
 sh get-docker.sh
```

## Step 3
### Create a repository on GitHub
Create a new repository on your GitHub account.

**DO NOT PUSH THE FILES YET.** 

## Step 4
### Add the required secrets to the repository
Add the following secrets to the repository:
  - `SERVER_IP`: The IPv4 address of your server. Yes, it needs to be an IPv4 address. Even though it's a domain pointing to an IPv6, GitHub still needs an IPv4 address.
  - `SERVER_NAME`: The domain name of your website, e.g. `example.com` or `www.example.com` or both.
  - `SSH_KEY`: The SSH key of your server.

## Step 5
### Point the domain to your server
Point the domain to your server's **IPv4** address.

## Step 5
### Deploy the website
- Just push the files to the repository.
- The deployment will start automatically.

