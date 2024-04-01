FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

WORKDIR /app

COPY requirements.txt .
COPY app.py .

RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080

CMD ["exec", "gunicorn", "--bind", ":$PORT", "--workers", "1", "--threads", "8", "--timeout", "0",  "app:app"] 
