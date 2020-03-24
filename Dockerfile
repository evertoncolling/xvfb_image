FROM ubuntu:latest

# =========== Basic Configuration ======================================================
RUN apt update && apt install -y default-jre && apt install -y python3 && \
    apt install -y python3-pip && apt install -y xvfb && apt install -y build-essential && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install -y nodejs && apt install -y sudo && apt install -y libgfortran3 && \
    apt install -y npm && \
    pip3 install JPype1 numpy matplotlib scipy scikit-learn cognite-sdk \
    jupyter jupyterlab plotly dash gekko tensorflow keras sympy ipywidgets

# ========== Create an user and environmental variables associated to it ===============
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# ============ Set some environmental vars and change user =============================
USER docker
ENV USER docker
WORKDIR /home/docker/
