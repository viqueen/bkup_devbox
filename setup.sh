#! /usr/bin/env bash

function init_brew() {
    # home_brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # first some fun
    brew install cowsay
    brew install fortune
    echo "fortune | cowsay" >> ~/.bash_profile
}

# requires jdk being installed first
function init_tools() {
    brew install jenv
    brew install mvnvm
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    nvm install node
}

function post_install() {
    # create ~/.profile link if needed
    if [ -f ~/.bash_profile ];
    then
        ln -sfnv ~/.bash_profile ~/.profile
    fi

    VIQUEEN_DEVBOX_HOME=$(cd "$(dirname "$0")" && pwd -P)
    echo "export VIQUEEN_DEVBOX_HOME=${VIQUEEN_DEVBOX_HOME}" >> ~/.profile
    echo 'export PATH="$PATH:${VIQUEEN_DEVBOX_HOME}/bin"' >> ~/.profile

    # setup maven
    echo 'export MAVEN_OPTS="-Xms1680m -Xmx2048m -XX:MaxMetaspaceSize=384m -XX:MaxPermSize=384m"' >> ~/.profile

    # setup pretty git log
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
}

function configure_vim() {
    # install vundle
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

    # setup vim
    VIQUEEN_DEVBOX_HOME=$(cd "$(dirname "$0")" && pwd -P)
    ln -sfnv ${VIQUEEN_DEVBOX_HOME}/.vimrc ~/.vimrc
    ln -sfnv ${VIQUEEN_DEVBOX_HOME}/.vim  ~/.vim

    git config --global core.editor vim
    vim +PluginInstall +qall
}

function configure_prompt() {
    VIQUEEN_DEVBOX_HOME=$(cd "$(dirname "$0")" && pwd -P)
    ln -sfnv ${VIQUEEN_DEVBOX_HOME}/.shell_prompt.sh ~/.shell_prompt.sh
    echo "source ~/.shell_prompt.sh" >> ~/.profile
}

function configure_atlas() {
    echo "export ATLAS_MVN=$(which mvn)"
}

eval $@