# Temel imaj olarak hafif bir Python sürümü kullan
FROM python:3.9-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Gereksinimleri kopyala ve kur
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyasını kopyala
COPY app.py .

# 8080 portunu dışarıya aç (sadece bilgi amaçlıdır)
EXPOSE 8080

# Uygulamayı çalıştır
CMD ["python", "app.py"]

