FROM python:3.9.6-buster

ENV POETRY_VERSION="1.1.6"

EXPOSE 5000/tcp

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache --update python3 python3-dev py3-pip \
    cargo gcc g++ libffi-dev make openssl-dev rust

RUN pip install --ignore-installed "poetry==${POETRY_VERSION}"

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

CMD ["poetry", "run", "flask", "run", "--host", "0.0.0.0"]
