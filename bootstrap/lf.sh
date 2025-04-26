cd /tmp
wget -O lf.tar.gz https://github.com/gokcehan/lf/releases/download/r35/lf-linux-amd64.tar.gz
tar -xf lf.tar.gz lf
cp lf $HOME/.local/bin/
rm lf.tar.gz lf
cd -

