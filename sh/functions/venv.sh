# Virtual environment helpers
# ---------------------------

function venv.get_filesystem() {
	df -PTh "$1" | tail -n1 | awk '{print $1 }'
}


# Quickly activate a venv in a standard location
function ++venv() {
	cwd=$( cd "$( readlink -e "$( pwd )" )" && pwd )
	ppath="${1:-"$cwd"}"
	locations=( 'venv' '.hsenv_main' )

	initial_filesystem="$( venv.get_filesystem "$ppath" )"

	while ! [ -z "$ppath" ] ; do

		for location in "${locations[@]}" ; do
			if [[ -d "$ppath"/$location ]] ; then
				echo "Activating $ppath/$location"
				source "$ppath"/$location/bin/activate
				return 0
			fi
		done

		new_path=$( dirname "$ppath" )
		if [ "$initial_filesystem" != "$( venv.get_filesystem "$new_path" )" ] ; then
			echo  "Could not find venv to activate, crossed file system boundary at $ppath" >&2
			return 2
		fi
		if [ "$ppath" == "/" ] && [ "$new_path" == "/" ] ; then
			echo 'Could not find venv to activate' >&2
			return 1
		fi
		ppath="$new_path"
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
	version=3
	[[ -z "$1" ]] && return 1
	[[ -z "$2" ]] || version="$2"
	name="$1"
	ppath="$HOME/development/$name"
	vdir="$XDG_DATA_HOME/projects/$name"
	if ! [[ -d "$vdir" ]] ; then
		[[ "$version" -eq 2 ]] && virtualenv2 "$vdir"
		[[ "$version" -eq 3 ]] && pyvenv "$vdir"
	fi
	[[ -d "$ppath" ]] || mkdir "$ppath"
	if [[ -d "$ppath/src" ]] ; then
		base="$ppath/src"
	elif [[ -d "$ppath/webapp" ]]; then
		base="$ppath/webapp"
	fi
	[[ -e "$base/venvlib" ]] || ln -s "$vdir/lib/"*"/site-packages/" "$base/venvlib"
	[[ -e "$base/venvsrc" ]] || ln -s "$vdir/src" "$base/venvsrc"
	workon "$name"
}

function mkvenv2() {
	[[ -z "$1" ]] && return 1
	mkvenv "$1" 2
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
	ppath="$HOME/development/$name"
	vdir="$XDG_DATA_HOME/projects/$name"
	[[ -d "$ppath" ]] && cd "$ppath"
	[[ -d "./webapp" ]] && cd "./webapp"
	[[ -d "./src" ]] && cd "./src"
	[[ -d "$vdir" ]] && . "$vdir/bin/activate"
	[[ -z "$TMUX" ]] || tmux rename-window "$name"
}

if [[ ! -z "$ZSH_VERSION" ]]; then
	compdef '_files -W "$XDG_DATA_HOME/projects/"' workon
elif [[ ! -z "$BASH_VERSION" ]]; then
	_getvenvdirs() {
		local projects=("$XDG_DATA_HOME/projects/$2"*)
		[[ -e "${projects[0]}" ]] && COMPREPLY=( "${projects[@]##*/}" )
	}
	complete -F _getvenvdirs workon
	complete -F _getvenvdirs rmvenv
fi