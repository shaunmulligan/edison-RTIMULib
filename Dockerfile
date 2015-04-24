#Base image
FROM resin/i386-debian:jessie

RUN apt-get update && apt-get install -y sudo usbutils python python-dev git-core cmake g++

RUN echo "/usr/local/lib" >> /etc/ld.so.conf

RUN git clone https://github.com/richards-tech/RTIMULib.git && \
    cd /RTIMULib/RTIMULib && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    ldconfig

RUN cd /RTIMULib/Linux/RTIMULibCal && make && make install 

RUN cd /RTIMULib/Linux/python && \
    python setup.py build && \ 
    python setup.py install

COPY /src/ /usr/src/app/

CMD ["bash", "/usr/src/app/start.sh"]
