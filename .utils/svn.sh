# stash filename
STASH_DIR="$HOME/.subversion/stash"
STASH_FILE="default"

source "`dirname $0`/common.sh"

# stash save
function svn_stash_save() {
    if [ ! -d "$STASH_DIR" ]; then
        mkdir -p $STASH_DIR
    fi

    if [ -n "$1" ]; then
        STASH_FILE="$1"
    fi
    local DIFF="`svn diff`"
    local RET=$?

    [ -z "$DIFF" ] && return 1
    [ "$RET" -ne 0 ] && return $RET

    echo "$DIFF" >! $STASH_DIR/$STASH_FILE
    svn revert -R .
    return $?
}
alias svn-save=svn_save

# stash pop
function svn_stash_pop() {
    if [ -n "$1" ]; then
        STASH_FILE="$1"
    fi

    if [ -f "$STASH_DIR/$STASH_FILE" ]; then
        patch -p0 < $STASH_DIR/$STASH_FILE
    else
        echo "No such stash file: '$STASH_FILE'"
    fi
    local RET=$?

    [ "$RET" -ne 0 ] && return $RET

    rm -rf $STASH_DIR/$STASH_FILE
    return $?
}
alias svn-pop=svn_pop

# stash list
function svn_stash_list() {
    local RET=1
    if [ ! -d "$STASH_DIR" ]; then
        mkdir -p $STASH_DIR
    fi

    for f in $STASH_DIR/*; do
        RET=0
        echo ${f##*/}
    done

    return $RET
}
alias svn-list=svn_list

# svn stash
function svn_stash() {
    case $1 in
        save    ) svn_stash_save $2 ;;
        pop     ) svn_stash_pop $2 ;;
        ""|list ) svn_stash_list ;;
        *       ) svn $@ ;;
    esac
}

# svn wrapper
function svnc() {
    case $1 in
        stash ) svn_stash ${@:2:($#-1)};;
        * )     svn $@;;
    esac
}
