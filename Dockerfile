FROM python:3.9-slim-buster
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]

controlplane:~$ cat app.py 
from flask import Flask
app = Flask(__name__)

# Define a route for the root URL ('/')
@app.route("/")
def hello_world():
    return "Hello, World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
