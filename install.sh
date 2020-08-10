
python3_config_dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu/
install_dir=/usr/local/vim8.1

echo
echo "python3 confi dir : $python3_config_dir"
echo "vim 8 install dir : $install_dir"
echo
read -p "Are you sure? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];then
    echo 'begin to install'
else
    echo 'Edit this script to set python3_config_dir and install_dir'
    exit -1
fi

sudo yum -y install perl-ExtUtils-Embed.noarch

tar -zxvf vim-8.1.2424.tar.gz
cd vim-8.1.2424

./configure --with-features=huge \
            --enable-python3interp \
            --enable-rubyinterp \
            --enable-luainterp \
            --enable-perlinterp \
            --with-python3-config-dir=$python3_config_dir \
            --enable-cscope \
            --enable-multibyte \
            --prefix=$install_dir

make && sudo make install

tar -zxvf global-6.6.4.tar.gz
cd global-6.6.4
./configure
make && sudo make install
