# We will use Ubuntu for our image
FROM ubuntu:latest
MAINTAINER Marel Moras, marel.moras@gmail.com

# Updating Ubuntu packages
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y nano


# Adding wget and bzip2
RUN apt-get install -y wget bzip2

# Add sudo
RUN apt-get -y install sudo

# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' doom
RUN adduser doom sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER doom
WORKDIR /home/doom/
RUN chmod a+rwx /home/doom/
#RUN echo `pwd`

# Anaconda installing
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh

x86_64.sh
RUN bash Anaconda3-2019.03-Linux-x86_64.sh -b
RUN rm Anaconda3-2019.03-Linux-x86_64.sh


# Set path to conda
#ENV PATH /root/anaconda3/bin:$PATH
ENV PATH /home/doom/anaconda3/bin:$PATH

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

# Configuring access to Jupyter
RUN mkdir /home/doom/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /home/doom/.jupyter/jupyter_notebook_config.py

# Jupyter listens port: 8888

# Run Jupytewr notebook as Docker main process
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/home/doom/notebooks", "--ip='*'", "--port=8888", "--no-browser"]

