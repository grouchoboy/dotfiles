# install fira sans
wget https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip
unzip 4.202.zip
rm 4.202.zip
mkdir -p ~/.local/share/fonts
cp -r Fira-4.202/ttf ~/.local/share/fonts/FiraSans

## install jetbrains nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
cp -r JetBrainsMono ~/.local/share/fonts
rm JetBrainsMono.zip

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
unzip IBMPlexMono.zip -d IMBPlexMono
cp -r IMBPlexMono ~/.local/share/fonts
rm -rf IBMPlexMono.zip IMBPlexMono
cd -
