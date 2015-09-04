function ctags_php() {
    ctags --file-scope=no --languages=php --langmap=php:.php.inc --php-types=c+f+d $@
}
alias ctags-php=ctags_php
