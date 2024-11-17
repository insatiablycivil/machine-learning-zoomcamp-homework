FROM python:3.10-bookworm

RUN pip install pipenv

WORKDIR /app

COPY ["Pipfile", "Pipfile.lock", "./"]
RUN pipenv install --deploy --system

COPY ["*.py", "churn-model.bin", "./"]

EXPOSE 9696

ENTRYPOINT [ "waitress", "--bind=0.0.0.0:9696", "predict:app"]