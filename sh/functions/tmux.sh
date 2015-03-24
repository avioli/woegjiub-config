# Modified TMUX start script from:
#	 http://forums.gentoo.org/viewtopic-t-836006-start-0.html

function tmx(){
	# Works because bash automatically trims by assigning to variables and by
	# passing arguments
	trim() { echo $1; }

	if [[ -z "$1" ]]; then
		echo "Specify session name as the first argument"
		exit
	fi

	base_session="$1"
	# This actually works without the trim() on all systems except OSX
	tmux_nb=$(trim `tmux ls | grep "^$base_session" | wc -l`)
	if [[ "$tmux_nb" == "0" ]]; then
		tmux new-session -s $base_session
	else
		# Make sure we are not already in a tmux session
		if [[ -z "$TMUX" ]]; then
			# Session is is date and time to prevent conflict
			session_id=`date +%Y%m%d%H%M%S`
			# Create new session and link to base session to share windows
			tmux new-session -d -t $base_session -s $session_id
			if [[ "$2" == "1" ]]; then
				# Create a new window in that session
				tmux new-window
			fi
			# Attach to the new session & kill it once orphaned
			tmux attach-session -t $session_id \; set-option destroy-unattached
		fi
	fi
}
