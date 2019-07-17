# Anaconda 2019.03 ubuntu based Docker image

The open-source Anaconda Distribution is the easiest way to perform Python/R data science and machine learning on Linux, Windows, and Mac OS X. With over 15 million users worldwide, it is the industry standard for developing, testing, and training on a single machine

* Quickly download 1,500+ Python/R data science packages
* Manage libraries, dependencies, and environments with Conda
* Develop and train machine learning and deep learning models with scikit-learn, TensorFlow, and Theano
* Analyze data with scalability and performance with Dask, NumPy, pandas, and Numba
* Visualize results with Matplotlib, Bokeh, Datashader, and Holoviews


docker run --name data-science -p 8888:8888 --env="DISPLAY" \
      -v "$PWD/notebooks:/home/ubuntu/notebooks" -d neil1145/anaconda:2019.03
