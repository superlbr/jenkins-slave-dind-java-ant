FROM registry.aliyuncs.com/acs-sample/jenkins-slave-dind-java

ENV ANT_VERSION 1.10.0

RUN wget http://mirrors.rackhosting.com/apache//ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz && \
tar -xvzf apache-ant-$ANT_VERSION-bin.tar.gz && \
mv apache-ant-$ANT_VERSION /usr/local/apache-ant && \
rm apache-ant-$ANT_VERSION-bin.tar.gz

# add ivy
# RUN wget http://mirrors.rackhosting.com/apache//ant/ivy/2.4.0/apache-ivy-2.4.0-bin.tar.gz
# RUN tar -xvzf apache-ivy-2.4.0-bin.tar.gz
# RUN mv apache-ivy-2.4.0/ivy-2.4.0.jar /usr/local/apache-ant/lib

ENV ANT_HOME /usr/local/apache-ant
ENV PATH $PATH:$ANT_HOME/bin

CMD ["/usr/sbin/sshd", "-D"]