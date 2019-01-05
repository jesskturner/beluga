from sanic import Sanic

from beluga.routes import base_routes

from settings import WEB_PORT


app = Sanic(__name__)
app.blueprint(base_routes)


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=int(WEB_PORT))
