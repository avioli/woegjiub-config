alias drep="grep -riI --exclude-dir=fixtures --exclude-dir=venv --exclude-dir=migrations --exclude-dir=static --exclude=*.json 2>/dev/null"
alias feh="feh -Z. "
alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias ftypes="find . ! -path '*/.git/*' -type f -iname '*.*' | rev | cut -d . -f1 | rev | sort | uniq -ic | sort -rn"
alias grep='grep --color=auto'
alias ll="ls -lAp"
alias ls="ls -hF --color=always --group-directories-first"
alias lsblkv="lsblk -o name,size,type,fstype,ro,mountpoint,label,uuid,partuuid"
alias pipudate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias ramused="ps -u $LOGNAME -o rss,command | grep -v peruser | awk '{sum+=$1} END {print sum/1024}'"
alias scan="scanimage --format=tiff >"
alias ssize="sudo du -sh --exclude="/home" --exclude="/mnt" --exclude="/srv" / 2>/dev/null"
alias vi='vim -p'

# Opens up a vim Session of the name provided
function vims(){
	vim -S $XDG_CACHE_HOME/vim/sessions/$1
}

# Opens in vim all files containing the text given
function vsopen(){
	vim -p $(djrep -lir "$@");
}

# Opens in vim all files whose name contains the text given
function vfopen(){
	vim -p $(find -iname "$@");
}

# opens in vim all files containing the text given, diffed
function vdiff(){
	vimdiff $(grep -lir "$@");
}
