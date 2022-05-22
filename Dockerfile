# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9-slim-bullseye



EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

WORKDIR /code

#COPY requirements.txt /code/
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system --deploy --verbose

#RUN pip install -r requirements.txt


COPY . /code/
#RUN pip install --upgrade setuptools wheel
#RUN pip install --upgrade pipenv
#CMD [ "pipenv","shell" ]



# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project.wsgi"]
