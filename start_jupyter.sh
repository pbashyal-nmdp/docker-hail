export SPARK_HOME=/hail/spark-2.1.0-bin-hadoop2.7
export HAIL_HOME=/hail/hail
export ANACONDA_HOME=/hail/anaconda2/
export PATH=$PATH:$ANACONDA_HOME/bin:$SPARK_HOME/bin:$HAIL_HOME/bin

export PYTHONPATH="$HAIL_HOME/python:$SPARK_HOME/python:$(echo ${SPARK_HOME}/python/lib/py4j-*-src.zip | tr '\n' ':')$PYTHONPATH"
export SPARK_CLASSPATH=$HAIL_HOME/jars/hail-all-spark.jar


export PYSPARK_SUBMIT_ARGS="--driver-memory ${JUPYTER_DRIVER_MEMORY} pyspark-shell"
echo "Starting Jupyter Spark Driver with memory:" $JUPYTER_DRIVER_MEMORY

# Add the sample notebooks
cp -r $HAIL_HOME/tutorials /notebooks/


jupyter notebook --allow-root --notebook-dir=/notebooks
