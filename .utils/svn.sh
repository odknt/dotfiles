# stash filename
STASH_DIR="$HOME/.subversion/stash"
STASH_FILE="default"

# stash save
function svn_save() {
    if [ ! -d "$STASH_DIR" ]; then
        mkdir -p $STASH_DIR
    fi

    if [ -n "$1" ]; then
        STASH_FILE="$1"
    fi
    svn diff >! $STASH_DIR/$STASH_FILE
    RET=$?

    if [ "$RET" -eq 0 ]; then
        svn revert -R .
        return $?
    fi

    return $RET
}
alias svn-save=svn_save

# stash pop
function svn_pop() {
    if [ -n "$1" ]; then
        STASH_FILE="$1"
    fi

    if [ -f "$STASH_DIR/$STASH_FILE" ]; then
        patch -p0 < $STASH_DIR/$STASH_FILE
    fi
    RET=$?

    if [ "$RET" -eq 0 ]; then
        rm -rf $STASH_DIR/$STASH_FILE
        return $?
    fi

    return $RET
}
alias svn-pop=svn_pop

# stash list
function svn_list() {
    if [ ! -d "$STASH_DIR" ]; then
        mkdir -p $STASH_DIR
    fi

    for f in $STASH_DIR/*; do
        echo ${f##*/}
    done

    return $RET
}
alias svn-list=svn_list
