FROM python:3.10

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libgl1-mesa-glx \
    libgtk2.0-dev \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

WORKDIR /code

COPY . /code

RUN pip install --no-cache-dir ultralytics flask opencv-python

EXPOSE 8005

ENV PYTHONPATH "${PYTHONPATH}:/code"

CMD ["python", "webb/app.py"]
