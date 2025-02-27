if [ ! -f $HOME/.local/bin/luarocks ]; then
    echo "Downloading Lua Rocks..."

    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz -P /tmp

    tar zxpf /tmp/luarocks-3.11.1.tar.gz -C /tmp
    
    (cd /tmp/luarocks-3.11.1 && \
        ./configure --with-lua=$LUA_DIR --with-lua-include=$LUA_DIR/include --with-lua-lib=$LUA_DIR/lib --prefix=$HOME/.local && \
        make -s && \
        make install -s)

    echo "Done Downloading Lua Rocks..."
fi

