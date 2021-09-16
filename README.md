# Server Requirements
* Python == 2.7.1
* graphene-django >== 2.2.0
* PostgreSQL >== 12.2
* Docker >== 20.10.8
* docker-compose >==1.26.0

# Requirements for deployment
* Invoke >== 1.4.1
* Ansible >== 3.9.5
* Vagrant >== 2.2.9

# Frontend part
To generate 'node_module' run *npn install*

# Backend part
* Clone repo:  `git@github.com:OleksandrTimoshenko/link_shortener.git`
* Create .env file: `cp .env.example .env`
* Create .env.certbot file: `cp .env.certbot.example .env.certbot`
* Provide all needed variables into this two files
* Create folder for store nginx secrets: `mkdir ./nginx/secrets/`
* Add file with encrypted password: `echo "user:$apr1$OQJXr62u$68KdGsExAk3xPUjeo7Llg1" > ./nginx/secrets/.htpasswd`

# Vagrant setup
* Install required vagrant plugins: `invoke install-vagrant-plugins`
* Deploy vagrant machine: `invoke vagrant-provision`

# Deploy
* Add RSA key for connecting to server
* Deploy server: `invoke deploy-server`

# GrapfQL
## add new alias
mutation {  
    createUrl(fullUrl:  
        "https://www.youtube.com/watch?v=SbKpt9c4DdQ"  
    ) {  
        url {  
            id  
            fullUrl  
            urlHash  
            clicks  
            createdAt  
        }  
    }  
}  


## find existing alias by part of the link
query {  
  urls(url:"youtube") {  
    id  
    fullUrl  
    urlHash  
    clicks  
    createdAt  
  }  
}