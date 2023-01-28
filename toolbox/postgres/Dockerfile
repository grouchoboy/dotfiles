FROM "postgres:15.1-alpine"

RUN apk add zsh curl git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["postgres"]
