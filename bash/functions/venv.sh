# Virtual environment helpers
# ---------------------------

function venv.get_filesystem() {
	df -PTh "$1" | tail -n1 | awk '{print $1 }'
}


# Quickly activate a venv in a standard location
function ++venv() {
	cwd=$( cd "$( readlink -e "$( pwd )" )" && pwd )
	path="${1:-"$cwd"}"
	locations=( 'venv' '.hsenv_main' )

	initial_filesystem="$( venv.get_filesystem "$path" )"

	while ! [ -z "$path" ] ; do

		for location in "${locations[@]}" ; do
			if [[ -d "$path"/$location ]] ; then
				echo "Activating $path/$location"
				source "$path"/$location/bin/activate
				return 0
			fi
		done

		new_path=$( dirname "$path" )
		if [ "$initial_filesystem" != "$( venv.get_filesystem "$new_path" )" ] ; then
			echo  "Could not find venv to activate, crossed file system boundary at $path" >&2
			return 2
		fi
		if [ "$path" == "/" ] && [ "$new_path" == "/" ] ; then
			echo 'Could not find venv to activate' >&2
			return 1
		fi
		path="$new_path"
	done

	echo 'Could not find venv to activate' >&2
	return 1
}

# Deacticate a venv, assuming it is standard and uses `deactivate()`
function --venv() {
	if command -V 'deactivate' &>/dev/null ; then
		deactivate
	elif command -V 'deactivate_hsenv' &>/dev/null ; then
		deactivate_hsenv
	fi
}

function mkvenv() {
	[[ -z "$1" ]] && return 1
	name="$1"
	path="$HOME/development/$name"
	vdir="$XDG_DATA_HOME/projects/$name"
	if command_exists virtualenv2; then
		[[ -d "$vdir" ]] || virtualenv2 "$vdir"
	else
		[[ -d "$vdir" ]] || pyvenv "$vdir"
	fi
	[[ -d "$path" ]] || mkdir "$path"
	workon $name
}

function rmvenv() {
	[[ -z "$1" ]] && return 1
	name="$1"
	vdir="$XDG_DATA_HOME/projects/$name"
	[[ -d "$vdir" ]] && rm -rf "$vdir"
}

function workon() {
	[[ -z "$1" ]] && return 1
	name="$1"
	path="$HOME/development/$name"
	vdir="$XDG_DATA_HOME/projects/$name"
	[[ -d "$path" ]] && cd "$path"
	[[ -d "$vdir" ]] && . "$vdir/bin/activate"
	[[ -z "$TMUX" ]] || tmux rename-window "$name"
}

_getvenvdirs() {
	local projects=("$XDG_DATA_HOME/projects/$2"*)
	[[ -e "${projects[0]}" ]] && COMPREPLY=( "${projects[@]##*/}" )
}

complete -F _getvenvdirs workon
complete -F _getvenvdirs rmvenv
