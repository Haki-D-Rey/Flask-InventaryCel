FROM python:3-alpine

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install -r requirements.txt

ADD . /app/

EXPOSE 8086

# Bundle app source
COPY . .

COPY ./.venv/Lib/site-packages/flask_apispec/static /usr/local/lib/python3.10/site-packages/flask_apispec/static

EXPOSE 5000
CMD [ "gunicorn", "--port=5000", "app:app" ]