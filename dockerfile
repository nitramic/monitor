FROM telegraf as telegraf
COPY ./scripts /etc/telegraf/
COPY ./configs/telegraf.conf /etc/telegraf/
RUN apt update
RUN apt upgrade -y
RUN apt install python -y
WORKDIR /etc/telegraf
RUN python --version
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python get-pip.py
RUN pip --version
RUN python -m pip install -r requeriments.txt
