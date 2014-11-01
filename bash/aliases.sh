alias cal="cal -3"
alias drep="grep -riI --exclude-dir=fixtures --exclude-dir=venv --exclude-dir=migrations --exclude-dir=static --exclude=*.json 2>/dev/null"
alias feh="feh -B black -e LiberationMono-Regular/24 -C /usr/share/fonts/TTF"
alias fehs="feh -Z." # Initial is correct on all, but flicker on N/P
alias fehm="feh -g 2880x1800" # No flicker on N/P, still scales to screen
alias feht="fehm -A \;\"image-metadata.sh edit-tags %f\" --info \"image-metadata.sh show %f\" "
alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias ftypes="find . ! -path '*/.git/*' -type f -iname '*.*' | rev | cut -d . -f1 | rev | sort | uniq -ic | sort -rn"
alias grep='grep -I --color=auto'
alias ls="ls -FA --color=always --group-directories-first"
alias ll="ls -lh --time-style=long-iso"
alias l="ll"
alias lsblkv="lsblk -o name,size,type,fstype,ro,mountpoint,label,uuid,partuuid"
alias pipudate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias python="python -q"
alias ramused="ps -u $LOGNAME -o rss,command | grep -v peruser | awk '{sum+=$1} END {print sum/1024}'"
alias scan="scanimage --format=tiff >"
alias ssize="sudo du -sh --exclude="/home" --exclude="/mnt" --exclude="/srv" / 2>/dev/null"
alias sqlite3="sqlite3 -column -header"
alias vi='vim -p'

#cd then ls
function cs(){ builtin cd "$@" && ll; }

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
