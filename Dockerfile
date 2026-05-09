FROM intel/oneapi-hpckit:latest

# Avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install utilities
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    git \
    wget \
    curl \
    vim \
    ninja-build \
    pkg-config \
    libboost-all-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
ENV CONDA_DIR=/opt/conda

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p $CONDA_DIR && \
    rm miniconda.sh

ENV PATH=$CONDA_DIR/bin:$PATH

# Create a default Python environment
RUN conda create -n dev python=3.12 numpy scipy pandas matplotlib jupyter -y

# Auto-activate
RUN echo "source activate dev" >> /root/.bashrc

# Intel environment setup
RUN echo "source /opt/intel/oneapi/setvars.sh" >> /root/.bashrc
