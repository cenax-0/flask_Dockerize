# syntax=docker/dockerfile:1

FROM python:3.12-slim

WORKDIR /app

COPY . .

ENV VIRTUAL_ENV=/opt/venv

RUN python3 -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 5000 

ENV FLASK_APP=app.py 

ENV FLASk_ENV=development

COPY app.py /app

CMD ["flask", "run", "--host=172.30.10.8"]
