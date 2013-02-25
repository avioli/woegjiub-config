alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"

# South Migration Helper
function mig(){
	python manage.py schemamigration "$@" --auto;
	python manage.py migrate "$@";
}
