# Yes or No message
function yes_no() {
    [ -z $1 ] && return 0

    echo "$1 [Y/n]"
    read ANSWER

    ANSWER=`echo $ANSWER | tr y Y | tr -d '[\[\]]'`
    #echo $ANSWER
    case $ANSWER in
        ""|Y* ) return 1;;
        *     ) return 0;;
    esac
}
