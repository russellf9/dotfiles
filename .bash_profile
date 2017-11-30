




#play
alias play='/Applications/play-1.4.4/play'

# alias
alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias week='date +%V' # Get week number


# kill all application running on a specified port.
kill_port() {
    local pids
    pids="$( lsof -i TCP:"$1" | awk '/LISTEN/ { print $2 }')"

    if [ "$?" -ne 0 ] || [ -z "$pids" ]
    then
        echo 'No processes was found; nothing was killed.'
    else
        kill -9 $pids
    fi
}


# qudini functions

run_qudiniapp() {
    kill_port 8080
    kill_port 4443
    brew services restart memcached
    play run -DuseTestDataFixtures=true
}

auto_test_qudiniapp() {
    # Changing the DB test configuration here can be easier than maintaining
    # a divergent configuration file in the Git repo.
    kill_port 9000
    brew services restart memcached
    play auto-test \
            -Dtestdb=mysql://qudini:qudini@localhost/qudini \
            -DuseTestDataFixtures=true
}

test_qudiniapp() {
    # Changing the DB test configuration here can be easier than maintaining
    # a divergent configuration file in the Git repo.
    kill_port 9000
    brew services restart memcached
    play test \
            -Dtestdb=mysql://qudini:qudini@localhost/qudinitest3
}

recent_remote_branches() {
    git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/remotes \
            | grep -v HEAD \
            | sed 's!^origin/!!' \
            | head -n 40
}

unstage_built_frontend_files() {
    find . -type f -iname '*.min.js' -o -iname '*.css' -o -iname '*.css.map' \
        | xargs git reset >/dev/null
}

update_all_scss_timestamps() {
    find "$1" -type f -iname '*.scss' -exec touch {} \;
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

unstage_built_frontend_files() {
    find . -type f -iname '*.min.js' -o -iname '*.css' -o -iname '*.css.map' \
        | xargs git reset >/dev/null
}

open_bash () {
	atom ~/.bash_profile
}

# TODO make list case insensitive
move_screenshots() {
	mv ~/Desktop/*.{png,jpg,JPG} ~/Documents/qudini/qudini-screenshots
}


delete_all_downloads() {
	find ~/Downloads/ -maxdepth 1 -type f -delete
}

empty_trash() {
	rm -rf ~/.Trash/*rv
}

sbt() {
   "$(which sbt)" "$@" -Dsbt.ivy.home="$HOME"/play-2-sbt-home
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}
# Open man page as PDF
function manpdf() {
 man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Update App Store apps
function updateApps() {
  sudo softwareupdate -i -a
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH="$(ruby -e 'puts Gem::user_dir')/bin:$PATH"

# Add Vim Key bindings
# set -o vi
# set keymap vi-command
