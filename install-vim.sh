python3_config_dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu/
install_dir=/usr/local/vim8.1

sudo yum install perl-ExtUtils-Embed.noarch

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
