############################################################
# Append the following content to the file ~/.bashrc
############################################################

zoomTerminal()
{
	termServer='gnome-terminal-server'
	ppid=`ps -o ppid= $$`

	parent=`ps -o comm= $ppid`

	# Bash process is generate from gnome-terminal-server
	if [[ $termServer =~ $parent ]]
	then
		xdotool key ctrl+shift+plus
	fi
}

zoomTerminal
