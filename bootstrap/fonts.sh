cd /tmp
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

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
unzip CascadiaCode.zip -d CascadiaCode
cp -r CascadiaCode ~/.local/share/fonts
rm CascadiaCode.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
unzip IBMPlexMono.zip -d IMBPlexMono
cp -r IMBPlexMono ~/.local/share/fonts
rm -rf IBMPlexMono.zip IMBPlexMono


wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Go-Mono.zip
unzip Go-Mono.zip -d Go-Mono
cp -r Go-Mono ~/.local/share/fonts
rm -rf Go-Mono.zip Go-Mono

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip
unzip Meslo.zip -d Meslo
cp -r Meslo ~/.local/share/fonts
rm -rf Meslo.zip Meslo

wget  -O inter.zip https://www.fontsquirrel.com/fonts/download/inter
unzip inter.zip -d inter
cp -r inter ~/.local/share/fonts
rm -rf inter.zip inter
