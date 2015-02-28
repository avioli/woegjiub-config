alias cal="cal -3"
alias drep="grep -riIn --exclude-dir=fixtures --exclude-dir=venv --exclude-dir=migrations --exclude-dir=static --exclude=*.json 2>/dev/null"
alias dag="ag --ignore fixtures --ignore static --ignore migrations --ignore venv --ignore *.json 2>/dev/null"
alias feh="feh -B black -e LiberationMono-Regular/24 -C /usr/share/fonts/TTF"
alias fehs="feh -Z." # Initial is correct on all, but flicker on N/P
alias fehm="feh -g 2880x1800" # No flicker on N/P, still scales to screen
alias feht="fehm -A \;\"image-metadata.sh edit-tags %f\" --info \"image-metadata.sh show %f\" "
alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias ftypes="find . ! -path '*/.git/*' -type f -iname '*.*' | rev | cut -d . -f1 | rev | sort | uniq -ic | sort -rn"
alias grep='grep -I --color=auto'
alias j='jobs -l'
alias ls="ls -FA --color=always --group-directories-first"
alias ll="ls -lh --time-style=long-iso"
alias l="ll"
alias lsblkv="lsblk -o name,size,type,fstype,ro,mountpoint,label,uuid,partuuid"
alias pipudate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias piplistglobal="pip list | sort > l1 && pip list --user | sort > l2 && comm l1 l2 -2 -3 && rm l1 && rm l2"
alias scan="scanimage --format=tiff >"
alias ssize="sudo du -sh --exclude="/home" --exclude="/mnt" --exclude="/srv" / 2>/dev/null"
alias sqlite3="sqlite3 -column -header"
alias v='vim'
alias wq="workon" && complete -F _getvenvdirs wq

# cd then ls
function cs(){ builtin cd "$@" && ll; }

# Check a python repo before committing
function chp(){
	if [[ -f /usr/bin/ag ]]; then
		dag "db.set_trace\(\)"
		dag "pu.db"
		dag "{% pdb %}"
		dag " print\("
		dag "raise$"
	else
		drep "db.set_trace()"
		drep "pu.db"
		drep "{% pdb %}"
		drep " print("
		drep "raise$"
	fi
}

function fag(){
	find -iname "$1" -type f -exec ag "${@:2}" {} +
}

function ramused(){
	ps -u $LOGNAME -o rss,command | grep -v peruser | awk '{sum+=$1} END {print "'"$LOGNAME"': " sum/2014}'
	ps -e -o rss,command | grep -v peruser | awk '{sum+=$1} END {print "all: " sum/2014}'
}

# Opens up a vim Session of the name provided
function vims(){
	if [[ -z $1 ]]; then
		vim -S $XDG_DATA_HOME/vim/sessions/default.vim
	else
		vim -S $XDG_DATA_HOME/vim/sessions/$1
	fi
}

# Opens in vim all files containing the text given
function vsopen(){
	vim -p $(drep -lir "$@");
}

# Opens in vim all files whose name contains the text given
function vfopen(){
	vim -p $(find -iname "$@");
}

# opens in vim all files containing the text given, diffed
function vdiff(){
	vimdiff $(grep -lir "$@");
}

function c(){
	python -c "print($*)"
}
