FROM ubuntu:14.04
MAINTAINER Dayana <dayanna Aguirre>


RUN apt-get update -y
RUN apt-get install -y python-pip
RUN pip install Flask
RUN pip install SQLAlchemy
RUN pip install Flask-SQLAlchemy

WORKDIR /tmp

COPY servicio.py /tmp

EXPOSE  5000

ENTRYPOINT ["python"]
CMD ["servicio.py"]
