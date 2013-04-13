alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"
alias utas="sudo vpnc-connect utas && ssh cjdarko@alacritas.cis.utas.edu.au && sudo vpnc-disconnect"
alias gccu="gcc -Wall -ansi -pedantic -O"
alias ownreader="cd /home/darko/Development/www/woereader/ && source activate && ./manage.py runserver 0.0.0.0:8000"

# South Migration Helper
function mig(){
	python manage.py schemamigration "$@" --auto;
	python manage.py migrate "$@";
}
