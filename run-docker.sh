# Local Notebooks Directory to use as the default dir

export NOTEBOOK_DIR=$PWD/notebooks

# To increase the memory for spark, set DRIVER_MEMORY before calling run-docker.sh. Eg:
# export DRIVER_MEMORY=3g

docker run -d --name hail -v $NOTEBOOK_DIR:/notebooks -e JUPYTER_DRIVER_MEMORY="${DRIVER_MEMORY:-2g}" -p 80:8080 -p 4040:4040 hail:0.1
