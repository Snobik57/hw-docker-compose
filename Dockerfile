FROM python:3.9.6-alpine

WORKDIR usr/src/app

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# install dependencies
RUN pip install --upgrade pip

COPY stocks_products/requirements.txt usr/src/app/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r usr/src/app/requirements.txt

COPY stocks_products usr/src/app

