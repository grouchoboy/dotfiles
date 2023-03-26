FROM mysql:5.7.41-debian

RUN apt-get -y update && apt-get -y install zsh curl git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

EXPOSE 3306 33060
CMD ["mysqld"]
