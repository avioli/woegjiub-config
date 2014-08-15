function command_exists(){
	command -v "$1" 2>&1 >/dev/null ;
}

# Produces a recursive count of all files in each subdirectory
function count_files(){
	find $1 -maxdepth 1 -type d 2>/dev/null | while read d; do
		find -L "$d" -type f 2>/dev/null | wc -l | tr -d '\n';
		echo $'\t'$d
	done|sort -n
}

# Prints the total size taken by files with the extension provided
function sizefromtype(){
	find -iname "*.$@" -print0 | du --files0-from - -c -sh | tail -1 | sed 's/\([^ tab]\+\).*/\1 /'
}
