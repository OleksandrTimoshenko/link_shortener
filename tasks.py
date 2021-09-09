from invoke import task
from dotenv import load_dotenv
import os

load_dotenv()

@task
def registry_login(c):
    c.run("docker login -u $GITHUB_USER -p $GITHUB_TOKEN ghcr.io")