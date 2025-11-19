sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
type -p dumpcap
sudo chgrp wireshark /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
newgrp wireshark # if does not work restart the computer
