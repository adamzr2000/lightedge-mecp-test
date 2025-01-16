## build : docker build -t lightedge-upfservice-manager .
## run :   docker run --net=host --rm --privileged -it lightedge-upfservice-manager

FROM ubuntu:19.10
MAINTAINER Roberto Riggio <rriggio@fbk.eu>

# Updating to use archived repositories
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://old-releases.ubuntu.com/ubuntu|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|http://old-releases.ubuntu.com/ubuntu|g' /etc/apt/sources.list


# Installing python dependencies
RUN apt update
RUN apt -y install python3-pip wget unzip iptables
RUN pip3 install tornado==6.0.3 pymodm==0.4.1 influxdb==5.2.3 python-iptables==0.14.0

# Fetching the latest repository from lightedge-upfservice-manager.
RUN wget https://github.com/lightedge/lightedge-upfservice-manager/archive/master.zip
RUN unzip master.zip
RUN rm master.zip
RUN mkdir -p /etc/lightedge/
RUN ln -sf /lightedge-upfservice-manager-master/conf/ /etc/lightedge/upfservice
RUN mkdir -p /var/www/lightedge/
RUN ln -sf /lightedge-upfservice-manager-master/webui/ /var/www/lightedge/upfservice

# Add placeholder for appworker
RUN mkdir -p /usr/local/lib/python3.7/dist-packages/empower_core/ && \
    echo "EVERY = 1" > /usr/local/lib/python3.7/dist-packages/empower_core/appworker.py

# Run the controller
ENTRYPOINT ["python3.7", "/lightedge-upfservice-manager-master/lightedge-upfservice-manager.py"]

# Expose Web GUI
EXPOSE 8888
