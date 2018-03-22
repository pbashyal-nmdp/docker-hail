# Pre-reqs:
# wget https://repo.continuum.io/archive/Anaconda2-5.1.0-Linux-x86_64.sh
# wget https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz
# wget https://storage.googleapis.com/hail-common/distributions/0.1/Hail-0.1-20613ed50c74-Spark-2.1.0.zip

# Use Java 8 as the base image
FROM java:8

WORKDIR /hail

ADD Anaconda2-5.1.0-Linux-x86_64.sh /hail/
RUN sh Anaconda2-5.1.0-Linux-x86_64.sh -b -p /hail/anaconda2

ADD spark-2.1.0-bin-hadoop2.7.tgz /hail/

ADD Hail-0.1-20613ed50c74-Spark-2.1.0.zip /hail/
RUN unzip Hail-0.1-20613ed50c74-Spark-2.1.0.zip

# Install Jupyter/Spark plugin
RUN /hail/anaconda2/bin/pip install jupyter-spark

COPY jupyter /root/.jupyter

COPY start_jupyter.sh /hail/

VOLUME /notebooks
ENV JUPYTER_DRIVER_MEMORY 2g

CMD ["sh", "start_jupyter.sh"]
