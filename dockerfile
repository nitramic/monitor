FROM telegraf:1.27.1 as telegraf
# RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt upgrade -y
RUN apt install -y python2.7
RUN ls -la /usr/bin/pyt*
# RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1
WORKDIR /etc/telegraf
COPY ./scripts /etc/telegraf/
COPY telegraf.conf /etc/telegraf/
# RUN python --version
WORKDIR /usr/bin/
COPY ./scripts/requeriments.txt .
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python2.7 get-pip.py
RUN python2.7 -m pip --version
RUN python2.7 -m pip install -r requeriments.txt
