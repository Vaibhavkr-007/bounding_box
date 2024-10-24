FROM python:3.10

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code

EXPOSE 8005

ENV PYTHONPATH "${PYTHONPATH}:/code"

CMD ["python", "webb/app.py"]
