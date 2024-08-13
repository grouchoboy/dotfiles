https://github.com/devangshekhawat/Fedora-40-Post-Install-Guide


```
sudo nano /etc/dnf/dnf.conf
```

```
[main] 
gpgcheck=1 
installonly_limit=3 
clean_requirements_on_remove=True 
best=False 
skip_if_unavailable=True 
fastestmirror=1 
max_parallel_downloads=10 
deltarpm=true
```

```
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing \
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
sudo dnf update @sound-and-video \
sudo dnf install Multimedia
```
