function init_is_launchd() {
	command -v launchctl 2>&1 > /dev/null && return 0
	return 1
}

function init_is_systemd() {
	command -v systemctl 2>&1 > /dev/null && return 0
	return 1
}

function init_name() {
	if init_is_systemd; then
		echo "systemd"
	elif init_is_launchd; then
		echo "launchd"
	fi
}

function init_setenv() {
	[[ -z "$1" ]] && echo 'usage: init_set_envvar VAR "VALUE FOR VAR"' && return 1
	if init_is_systemd; then
		systemctl --user set-environment "$1"="$2"
	elif init_is_launchd; then
		launchctl setenv "$1" "$2"
	fi
}

function init_unsetenv() {
	[[ -z "$1" ]] && echo 'usage: init_uset_envvar VAR' && return 1
	if init_is_systemd; then
		systemctl --user unset-environment "$1"
	elif init_is_launchd; then
		launchctl unsetenv "$1"
	fi
}

function init_getenv() {
	# pass arguments, get their values
	[[ -z "$@" ]] && echo "usage: findenv ENVNAME1 ENVNAME2" && return
	set -f
	IFS=$'\n'
	envs=($(init_showenv))
	set +f
	unset IFS
	for env in "${envs[@]}"; do
		key=$(echo $env | cut -d "=" -f 1)
		value=$(echo $env | cut -d "=" -f 2-)
		for arg in "$@"; do
			[[ "$arg" == "$key" ]] && echo "$arg=$value"
		done
	done
}

function init_showenv() {
	if init_is_systemd; then
		systemctl --user show-environment
	elif init_is_launchd; then
		launchctl print gui/$UID | sed -n '/environment = {$/,/}$/s/[[:space:]]*\(.*\) => /\1=/p'
		launchctl print user/$UID | sed -n '/environment = {$/,/}$/s/[[:space:]]*\(.*\) => /\1=/p'
	fi
}

function init_importenv() {
	if init_is_systemd; then
		systemctl --user import-environment "$@"
	elif init_is_launchd; then
		if [[ -z "$@" ]]; then
			vars=$(init_showenv)
		else
			vars=$(findenv "$@")
		fi
		eval $(echo $vars | sed 's/^\(.*\)=\(.*\)$/export \1="\2"/')  # Would also work for systemd
	fi
}
