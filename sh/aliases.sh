alias cal="cal -3"
alias dag="ag --ignore fixtures --ignore static --ignore migrations --ignore venv --ignore *.json 2>/dev/null"
alias feh="feh -B black -e LiberationMono-Regular/24 -C /usr/share/fonts/TTF"
alias fehs="feh -Z." # Initial is correct on all, but flicker on N/P
alias fehm="feh -g 2880x1800" # No flicker on N/P, still scales to screen
alias feht="fehm -A \;\"image-metadata.sh edit-tags %f\" --info \"image-metadata.sh show %f\" "
alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias ftypes="find . ! -path '*/.git/*' -type f -iname '*.*' | rev | cut -d . -f1 | rev | sort | uniq -ic | sort -rn"
alias grep='grep -I --color=auto'
alias htop="htop -u $USER"
alias j='jobs -l'
alias ls="ls -FA --color=always --group-directories-first"
alias l="ls -lh --time-style=long-iso"
alias lsblkv="lsblk -o name,size,type,fstype,ro,mountpoint,label,uuid,partuuid"
alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias pipudate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias piplistglobal="pip list | sort > l1 && pip list --user | sort > l2 && comm l1 l2 -2 -3 && rm l1 && rm l2"
alias scan="scanimage --format=tiff >"
alias sqlite3="sqlite3 -column -header"
alias v='vim'
alias wq="workon" && complete -F _getvenvdirs wq

# calculator
c(){ python -c "print($*)"; }

# cd then ls
cs(){ builtin cd "$@" && ll; }

# Check a python repo before committing
chp(){
	dag "db.set_trace\(\)"
	dag "pu.db"
	dag "{% pdb %}"
	dag " print\("
	dag "raise$"
}

# find then ag
fag(){ find -iname "$1" -type f -exec ag "${@:2}" {} +; }

# open with default file handler
command_exists xdg-open && open(){ xdg-open "$1" "${@:2}" &>/dev/null & disown; }

ramused(){
	ps -u $LOGNAME -o rss,command | grep -v peruser | awk '{sum+=$1} END {print "'"$LOGNAME"': " sum/2014}'
	ps -e -o rss,command | grep -v peruser | awk '{sum+=$1} END {print "all: " sum/2014}'
}

# open by content
vsopen(){ vim -p $(dag -li "$@"); }
# open by name
vfopen(){ vim -p $(find -iname "$@"); }
# open session (if no name given, 'default.vim')
vims(){ vim -S "$XDG_DATA_HOME/vim/sessions/${1-default.vim}"; }

# find aliases
alias dj-models="fag models.py '^\s*class .*\((?!.*Enum)(.*)\):.*$'"