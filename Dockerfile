FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

WORKDIR /app

COPY requirements.txt .
COPY app.py .

RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000

CMD ["python", "app.py"]

CMD ["exec", "gunicorn", "--bind", ":$PORT", "--workers", "1", "--threads", "8", "--timeout", "0",  "app:app"] 
