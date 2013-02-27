alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias utas="sudo vpnc-connect utas && ssh cjdarko@alacritas.cis.utas.edu.au && sudo vpnc-disconnect"
alias gccu="gcc -Wall -ansi -pedantic -O"

# South Migration Helper
function mig(){
	python manage.py schemamigration "$@" --auto;
	python manage.py migrate "$@";
}
