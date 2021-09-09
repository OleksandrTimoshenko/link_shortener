from invoke import task
from dotenv import load_dotenv

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
    c.run(
        "cd deploy; \
         REGISTRY_TOKEN=$GITHUB_TOKEN \
	     REGISTRY_USER=$GITHUB_USER \
	     vagrant up --provision;"
    )