

# Hail on Docker

**Dockerized Hail with examples**

Hail installed with Anaconda/Apache Spark for local use. 

## Running a pre-built Docker image with Hail

You can specify the memory for the Spark Driver when the container starts up by adjusting `JUPYTER_DRIVER_MEMORY` variable.

* Make a directory where the notebook files will live.
  ```
  mkdir my_notebooks
  ```

* Start Hail Container 
  ```
  docker run -d --name hail -v $PWD/my_notebooks:/notebooks -e JUPYTER_DRIVER_MEMORY=2g -p 80:8080 -p 4040:4040 pbashyal/docker-hail:0.1
  ```

Change 80 to a different port if you don't have access to that port. 

* Login to Jupyter notebook
You should see the Jupyter notebook at http://localhost/ (Adjust per your docker host). Login using `hail` as password. You should see the tutorials directory with default Hail examples. Any notebooks you create here will persist in `my_notebooks` directory between restarts.

* Spark Job Page
After `HailContext` is created, the Spark Jobs page becomes available on port `4040`. Eg; http://localhost:4040
Watch the Job page to track progress on your Spark Jobs.


## Building Docker Image

 * Fetch Python/Spark/Hail dependencies

   ```
   ./get_files.sh
   ```

 * Build Docker Image

   ```
   ./build-docker.sh
   ```

 * Run the image
   
   ```
   ./run-docker.sh
   ```

