#vim
yes | sudo apt-get install ctags cscope vim git global clang clang-format
git config --global user.name "Chen Feng"
git config --global user.email "puck.chen@foxmail.com"
git config core.editor vim
cp ./vimrc ~/.vim/vimrc
cp ./linux-format ~/.vim/linux-format
cp linux-format ~/bin/
mkdir -p ~/.vim/cscope
touch ~/.vim/cscope/cscope.files
mkdir -p ~/bin
cp ./cs ~/bin
sudo chmod a+x ~/bin/cs
sudo echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc
sudo echo 'set completion-ignore-case on' >> ~/.inputrc
#linux
yes | sudo apt-get install gcc make libncurses5-dev openssl libssl-dev
yes | sudo apt-get install build-essential
yes | sudo apt-get install pkg-config
yes | sudo apt-get install libc6-dev
yes | sudo apt-get install bison
yes | sudo apt-get install flex
yes | sudo apt-get install libelf-dev
