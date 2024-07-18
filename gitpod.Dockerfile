FROM gitpod/workspace-full:latest

USER gitpod

RUN sudo apt-get update && sudo apt-get install -y \
    python3-pip python3-dev libmysqlclient-dev \
    mariadb-server-10.3 mariadb-client-10.3 libmariadbclient-dev \
    redis-server \
    && sudo apt-get clean
