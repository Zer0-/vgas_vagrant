apt-get -y install vim curl

AS_USER_SCRIPT=$( cat <<EOF
    mkdir .vim;
    cd .vim;
    mkdir -p ~/.vim/autoload ~/.vim/bundle; 
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;
    cd bundle;

    git clone https://github.com/junegunn/seoul256.vim.git;
    git clone https://github.com/vim-scripts/MatchTag.git;
    git clone https://github.com/edsono/vim-matchit.git ;
    git clone https://github.com/Lokaltog/vim-easymotion.git;
    git clone https://github.com/itchyny/lightline.vim.git;
    git clone https://github.com/tpope/vim-surround.git;
    git clone https://github.com/kien/ctrlp.vim.git;

    cp /vagrant/.vimrc /home/vagrant;
EOF
)
su - vagrant -c "$AS_USER_SCRIPT"
