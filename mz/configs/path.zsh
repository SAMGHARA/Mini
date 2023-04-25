# Environment PATH
PATH_NEW=(
    "$XDG_LOCAL_HOME/bin"
    "$XDG_LOCAL_HOME/go/bin"
    "$XDG_LOCAL_HOME/redis/bin"
    "$XDG_LOCAL_HOME/node/node_modules/.bin"
)
CPATH_NEW=(
    "$XDG_LOCAL_HOME/include"
    "$XDG_LOCAL_HOME/include/nginx"
)
LIBRARY_PATH_NEW=(
    "$XDG_LOCAL_HOME/lib"
    "$XDG_LOCAL_HOME/hiredis/lib"
)
LD_LIBRARY_PATH_NEW=(
    "$LIBRARY_PATH_NEW"
)

addENV PATH               PATH_NEW
addENV CPATH              CPATH_NEW
addENV LIBRARY_PATH       LIBRARY_PATH_NEW
addENV LD_LIBRARY_PATH    LD_LIBRARY_PATH_NEW

