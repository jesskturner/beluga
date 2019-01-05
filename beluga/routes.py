from sanic import Blueprint
from sanic.response import json

from settings import APP_NAME


base_routes = Blueprint('base_routes')


@base_routes.route("/_health_check")
async def health_check(request):
    """
    Return a message indicating that the application is healthy.
    """
    return json({
        "app": APP_NAME,
        "health": "OK",
    })
