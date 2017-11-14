#export PATH=$PATH:/Applications/sdk/tools:/Applications/sdk/platform-tools:$PATH
#export PATH=$PATH:/Applications/gradle-1.8/bin:$PATH
#export PATH=$PATH:/Applications/gradle-1.8/bin:$PATH
#export PATH=$PATH:/Applications/MAMP/Library/bin/mysql:$PATH
#ANDROID_HOME=/Applications/sdk/
#GRADLE_HOME=/Applications/gradle-1.8/bin
#QEO_HOME=/Users/factornine/localhosts/www.i-speak-qeo.com/QeoSDK-0.15.0
JAVA_HOME=$(/usr/libexec/java_home)export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH

# usage `setjdk 1.8`
function setjdk() {  
  if [ $# -ne 0 ]; then  
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
   if [ -n "${JAVA_HOME+x}" ]; then  
    removeFromPath $JAVA_HOME/bin  
   fi  
   export JAVA_HOME=`/usr/libexec/java_home -v $@`  
   export PATH=$JAVA_HOME/bin:$PATH  
  fi  
 }  
 function removeFromPath() {  
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
 }
setjdk 1.7i

#play
alias play='/Applications/play-1.4.2/play'



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function searchAndDestroy() {

  lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9

  echo "Port" $1 "found and killed."

}


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


# qudini

run_qudiniapp() {
		setjdk 1.8
		
    kill_port 8080
    kill_port 4443

    killall memcached
    memcached &
    sleep 3
    play run -DuseTestDataFixtures=true
}

auto_test_qudiniapp() {
    # Changing the DB test configuration here can be easier than maintaining
    # a divergent configuration file in the Git repo.

    kill_port 9000
    killall memcached
    memcached &
    sleep 3
    play auto-test \
            -Dtestdb=mysql://qudini:qudini@localhost/qudini \
            -DuseTestDataFixtures=true
}

test_qudiniapp() {
    # Changing the DB test configuration here can be easier than maintaining
    # a divergent configuration file in the Git repo.
		setjdk 1.8
		
    kill_port 9000
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
	open -a TextMate  /Users/factornine/.bash_profile
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
	setjdk 1.8
   "$(which sbt)" "$@" -Dsbt.ivy.home="$HOME"/play-2-sbt-home
}


#
alias github=GitHub

function GitHub()
{
    if [ ! -d .git ] ; 
        then echo "ERROR: This isnt a git directory" && return false; 
    fi
    git_url=`git config --get remote.origin.url`
    if [[ $git_url != https://github* ]] ;
        then echo "ERROR: Remote origin is invalid" && return false;
    fi
    url=${git_url%.git}
    open $url
}



export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Library/Ruby/Gems/2.0.0/gems/sass-3.4.13/bin:/Users/factornine/.gem/ruby/2.3.0/bin:/Applications/activator-1.3.12-minimal/bin:/Users/factornine/.gem/ruby/2.0.0/bin:/usr/local/mysql/bin:$PATH"

# Add Vim Key bindings
# set -o vi
# set keymap vi-command

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For RVM see https://rvm.io/help
source ~/.profile
