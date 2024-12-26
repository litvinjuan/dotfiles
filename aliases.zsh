# Shortcuts
alias te='open -a TextEdit'
alias py='python'
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AahlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

alias dotfiles="cd $DOTFILES"
alias dev='cd $HOME/dev'
alias fpg='cd $HOME/dev/fpg'

# Laravel
alias a="herd php artisan"
alias fresh="herd php artisan migrate:fresh --seed"
alias tinker="herd php artisan tinker"
alias seed="herd php artisan db:seed"
alias serve="herd php artisan serve"
alias vapor='php vendor/bin/vapor'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="herd composer"
alias php="herd php"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias ya='yarn add'
alias yad='yarn add -D'

# Docker
alias docker-composer="docker-compose"
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcub='docker compose up --build'
alias dcd='docker compose down'
alias dcr='docker compose down && docker compose up -d'

# Git
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias clone="git clone"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias stash="git stash -u"
alias pop="git stash pop"
alias prune="git fetch --prune"
alias pull="git pull"
alias push="git push origin"
alias pushh='git push origin main'
alias resolve="git add . && git commit --no-edit"
alias unstage="git restore --staged ."
alias wip="commit wip"