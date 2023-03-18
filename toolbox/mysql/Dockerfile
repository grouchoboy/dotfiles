FROM mysql:8.0.32-debian

RUN apt-get -y update && apt-get -y install zsh curl git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["mysqld"]