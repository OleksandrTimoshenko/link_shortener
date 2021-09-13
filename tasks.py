from invoke import task
from dotenv import load_dotenv
from os import system

load_dotenv()

@task
def registry_login(c):
    c.run("docker login -u $GITHUB_USER -p $GITHUB_TOKEN ghcr.io")

# run for the first time only
@task
def install_vagrant_plugins(c):
    c.run("vagrant plugin install vagrant-env")

@task
def vagrant_provision(c):
    system(
        "cd deploy; \
         REGISTRY_TOKEN=$GITHUB_TOKEN \
	     REGISTRY_USER=$GITHUB_USER \
	     vagrant up --provision;"
    )

@task()
def deploy_server(c):
    system(
        "ansible-galaxy install -r deploy/requirements.yaml; ANSIBLE_HOST_KEY_CHECKING=False \
         ansible-playbook -v -i $SERVER_IP, --user $SERVER_USER --private-key $KEY_RSA deploy/playbook.yaml \
         --extra-vars \"github_user=$GITHUB_USER github_token=$GITHUB_TOKEN\""
    )

@task
def ssh_to_server(c):
    # it`s difficult to use c.run() because of issue with ssh session styles
    system("ssh -i $KEY_RSA $SERVER_USER@$SERVER_IP")
