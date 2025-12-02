from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # Ortam değişkeni (Environment Variable) ile mesajı özelleştirme
    message = os.environ.get("MESAJ", "Merhaba DevOps Dünyası!")
    return f"<h1>{message}</h1>"

if __name__ == '__main__':
    # Basit bir geliştirme sunucusunda çalıştır (8080 portunda)
    app.run(debug=True, host='0.0.0.0', port=8080)
