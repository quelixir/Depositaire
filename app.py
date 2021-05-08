from flask import Flask
app = Flask(__name__)

# init
import config

# API
import routes.api.v1

# default route
@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()

