from django.shortcuts import get_object_or_404, redirect
from django.shortcuts import render
from .models import URL
import logging

logger = logging.getLogger(__name__)

def root(request, url_hash):
    url = get_object_or_404(URL, url_hash=url_hash)
    url.clicked()
    logger.info("URL generated!")

    return redirect(url.full_url)

def index (request):
    return render(request, 'index.html')