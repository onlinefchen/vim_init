#!/bin/zsh

# 首先设置主机名
echo "请输入你想设置的新主机名:"
read new_hostname
sudo scutil --set HostName "$new_hostname"

# 检查并安装 Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew 未安装，正在安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew 已安装。"
fi

# 检查并安装 zsh
if ! command -v zsh &> /dev/null
then
    echo "zsh 未安装，正在通过 Homebrew 安装 zsh..."
    brew install zsh
else
    echo "zsh 已安装。"
fi

# 设置 zsh 为默认 shell
echo "设置 zsh 为默认 shell..."
sudo chsh -s $(which zsh)

# 安装 Git
echo "正在安装 Git..."
brew install git

# 配置 Git
echo "正在配置 Git..."
git config --global user.name "Chen Feng"
git config --global user.email "connect.fengchen@gmail.com"

# 备份当前的 .zshrc 文件
cp ~/.zshrc ~/.zshrc.backup_$(date +%Y%m%d_%H%M%S)

# 创建新的 .zshrc 文件
echo "创建新的 .zshrc 文件..."
cat > ~/.zshrc << EOF
# 设置 zsh 的提示符
export PROMPT='%F{green}%n@%F{blue}%m %F{cyan}%~ %F{blue}%% %f'

# 启用 ls 命令颜色输出
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# 设置别名
alias ls='ls -G'
alias code='cd ~/code'

# 配置自动补全忽略大小写
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

EOF

# 检查 Docker 是否已安装
if ! command -v docker &> /dev/null
then
    echo "Docker 未安装，正在安装 Docker..."
    brew install --cask docker
    # 打开 Docker 应用（首次需要手动设置）
    open /Applications/Docker.app
else
    echo "Docker 已安装。"
fi

# Vundle 和 Vim 配置
echo "正在安装 Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vim/vimrc
echo "正在安装 Vim 插件..."
vim +PluginInstall +qall

echo "配置已更新！请重新启动你的终端，或运行 'source ~/.zshrc' 来应用更改。"

