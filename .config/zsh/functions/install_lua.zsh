LUA_DIR=$HOME/.local

if [ ! -f $HOME/.local/bin/lua5.1 ]; then
    echo "Downloading Lua..."

    wget https://www.lua.org/ftp/lua-5.1.4.tar.gz -P /tmp

    tar zxpf /tmp/lua-5.1.4.tar.gz -C /tmp

    ESCAPED_LUA_DIR=${LUA_DIR//\//\\\/}

    DEFAULT_LUA_DIR=/usr/local
    ESCAPED_DEFAULT_LUA_DIR=${DEFAULT_LUA_DIR//\//\\\/}

    LUA_PLAT=linux

    if [ $(uname -s) = 'Darwin']; then
        LUA_PLAT=macosx
    fi
    
    (cd /tmp/lua-5.1.4 && \
        sed -i -e "s/$ESCAPED_DEFAULT_LUA_DIR/$ESCAPED_LUA_DIR/g" Makefile && \
        make "$LUA_PLAT" && \
        make install && \
        mv $LUA_DIR/bin/lua $LUA_DIR/bin/lua5.1 && \
        mv $LUA_DIR/bin/luac $LUA_DIR/bin/luac5.1)

    echo "Done Downloading Lua..."
fi

