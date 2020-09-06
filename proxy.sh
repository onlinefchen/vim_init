#vim
yes | sudo apt-get install iptables ipset dnsmasq shadowsocks shadowsocks-libev
mkdir ~/work/github
cd ~/work/github
git clone https://github.com/zfl9/ss-tproxy
cd ss-tproxy
sudo install ss-tproxy /usr/local/bin
sudo install -d /etc/ss-tproxy
sudo install -m 644 ss-tproxy.conf gfwlist* chnroute* ignlist* /etc/ss-tproxy
sudo install -m 644 ss-tproxy.service /etc/systemd/system # 可选，安装 service 文件

cd -
cd vim_init
sudo cp ss.json /etc
sudo cp ss-tproxy.conf /etc/ss-tproxy/ss-tproxy.conf
cd -

git clone https://github.com/zfl9/chinadns-ng
cd chinadns-ng
make && sudo make install
cd -

echo "alias proxy='kill -9 (pidof ss-redir);sudo systemctl stop systemd-resolved; sudo ss-tproxy start'" ~/.bashrc

cd -
