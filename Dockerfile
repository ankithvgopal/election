FROM registry.access.redhat.com/ubi8/python-38

LABEL Version 1.0

WORKDIR /app

# Install requirements.txt
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy code from the current folder to /app inside the container
ADD . /app

USER root

RUN chown -R 1001 /app && chmod -R g=u /app && chgrp -R 0 /app

USER 1001

# Expose the port server listen to
EXPOSE 8081

# Define command to be run when launching the container
CMD ["python", "app.py"]
