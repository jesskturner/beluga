from application import app

def test_health_check_returns_ok():
    request, response = app.test_client.get('/_health_check')
    assert response.status == 200
