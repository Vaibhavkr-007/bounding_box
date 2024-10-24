FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    libgthread-2.0-0 \
    libglib2.0-0 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8005

CMD ["python", "webb/app.py"]
