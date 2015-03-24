function mpcra(){
	mpc clear
	mpc find album "$(mpc list album | shuf -n1)" | mpc add
	mpc play
}
