[ -d "/opt/homebrew/opt/ruby/include" ] && export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/ruby/lib"

[ -d "/opt/homebrew/opt/ruby/include" ] && export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/ruby/include"

[ -d "/opt/homebrew/opt/openjdk/include" ] && export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openjdk/include"
