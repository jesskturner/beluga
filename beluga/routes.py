from sanic import Blueprint
from sanic.response import file, json
from sanic.exceptions import NotFound

from settings import APP_NAME


base_routes = Blueprint('base_routes')


@base_routes.route("/")
async def index(request):  # noqa
    return await file('dist/index.html')


@base_routes.route("/_health_check")
async def health_check(request):
    """
    Return a message indicating that the application is healthy.
    """
    return json({
        "app": APP_NAME,
        "health": "OK",
    })
