function _get_proj_path() {
	ppath=$( cd "$( readlink -e "$( pwd )" )" && pwd )
	[[ -z "$ppath" ]] && ppath="/"

	while [[ "$ppath" != "/" ]] ; do
		if [[ -d "$ppath/src" ]]; then
			echo "$ppath"
			unset ppath
			return 0
		fi
		ppath="$(dirname "$ppath")"
	done

	unset ppath
	echo 'Could not find src directory for project' >&2
	return 1
}

function vd-mysql() {
	addr_arg='-h"$MYSQL_PORT_3306_TCP_ADDR"'
	port_arg='-P"$MYSQL_PORT_3306_TCP_PORT"'
	auth_arg='-uroot -p"pass"'
	cmd="exec mysql $addr_arg $port_arg $auth_arg"
	docker run -it --rm --link mariadb:mysql mariadb sh -c "$cmd"
	unset addr_arg port_arg auth_arg cmd
}

function vd-psql() {
	addr_arg='-h "$PG_PORT_5432_TCP_ADDR"'
	port_arg='-p "$PG_PORT_5432_TCP_PORT"'
	auth_arg='-U postgres'
	cmd="exec psql $addr_arg $port_arg $auth_arg"
	docker run -it --rm --link postgres:pg postgres sh -c "$cmd"
	unset addr_arg port_arg auth_arg cmd
}

function vd-build() {
	[[ -z "$1" ]] || dockerfile="$1"
	[[ -z "$2" ]] || tag="$2"

	if [[ -z "$tag" ]]; then
		ppath="$(_get_proj_path 2>/dev/null)"
		[[ -z "$ppath" ]] || tag="$(basename $ppath)"
		unset ppath
	fi
	[[ -z "$tag" ]] && [[ ! -z "$dockerfile" ]] && tag="$dockerfile"

	[[ -z "$dockerfile" ]] && [[ -f "Dockerfile" ]] && dockerfile="Dockerfile"
	[[ -z "$dockerfile" ]] && [[ ! -z "$tag" ]] && [[ -f "$tag" ]] && dockerfile="$tag"
	[[ -z "$dockerfile" ]] && echo "No Dockerfile found" >&2 && return 1

	docker build -t "local/$tag" -f "./$dockerfile" .
	unset tag dockerfile
}

function vd-run() {
	ppath="$(_get_proj_path)"
	[[ -z "$ppath" ]] && return 1
	tag="local/$(basename "$ppath")" # local/project_name
	srcvol="/mnt/host$ppath/src:/var/www/src"
	varvol="/mnt/host$ppath/var:/var/www/var"

	while getopts "dp:" o; do
		case "${o}" in
			d)
				detach=true
				;;
			p)
				ports="${OPTARG}"
				;;
		esac
	done

	shift "$((OPTIND - 1))"

	if [[ -z "$ports" ]] && [[ -z "$detach" ]]; then
		docker run -v "$srcvol" -v "$varvol" -it --rm "$tag" "$@"
	elif [[ -z "$ports" ]]; then
		docker run -v "$srcvol" -v "$varvol" -d "$tag" "$@"
	elif [[ -z "$detach" ]]; then
		docker run -v "$srcvol" -v "$varvol" -p "$ports" -it --rm "$tag" "$@"
	else
		docker run -v "$srcvol" -v "$varvol" -p "$ports" -d "$tag" "$@"
	fi
	unset ppath tag srcvol varvol detach ports
}

function vd-venv-run() {
	vd-run bash -c "source ../venv/bin/activate && $@"
}

function vd-runserver() {
	vd-run -p 80:8080 ../venv/bin/python manage.py runserver_plus 0.0.0.0:8080
}

function vd-runserverd() {
	vd-run -d -p 80:8080 ../venv/bin/python manage.py runserver_plus 0.0.0.0:8080
}
