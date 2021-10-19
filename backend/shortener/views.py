from django.shortcuts import get_object_or_404, redirect
from django.shortcuts import render
from .models import URL
from django.http import HttpResponse


def root(request, url_hash):
    url = get_object_or_404(URL, url_hash=url_hash)
    url.clicked()

    return redirect(url.full_url)

def index (request):
    return render(request, 'index.html')

def healthcheck(request):
    return HttpResponse(status=200)