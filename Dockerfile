FROM continuumio/anaconda3
# FROM pytorch/pytorch:latest

# Linux Environment Setting
RUN apt-get update && apt-get -y install \
    vim pkg-config libcairo2 libcairo2-dev \
    git sudo gcc ssh openssh-server \
    python3-dev python3-pip python3-setuptools
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Seoul apt-get -y install tzdata
RUN pip install --upgrade pip
RUN service ssh start


# User setting
RUN adduser bbl
#RUN groupadd -g ${GROUP_ID} lungteam
#RUN useradd -u ${USER_ID} -g lungteam -p $(openssl passwd -1 vuno2018) vuno
RUN echo "bbl ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER bbl
WORKDIR /home/bbl

# Python Setting
ENV PATH="/home/bbl/.local/bin:${PATH}"
RUN mkdir Decode_BBL
COPY --chown=bbl:bbl . Decode_BBL/.
ENV PYTHONPATH "${PYTHONPATH}:/home/jeong/Decode_BBL"
RUN sudo chown -R bbl:bbl /opt/conda
RUN conda env create -f Decode_BBL/environment.yml
RUN conda init
