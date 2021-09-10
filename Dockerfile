FROM ubuntu
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install ssh -y
RUN apt-get install wget -y
RUN apt-get install npm -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'Port 22' >>  /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config
RUN echo root:uncleluo|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
