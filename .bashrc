# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Minecraft path
if ! [[ "$PATH" =~ "$HOME/Games/Minecraft:" ]]
then
    PATH="$HOME/Games/Minecraft:$PATH"
fi

# User binaries
if ! [[ "$PATH" =~ "$HOME/.bin:" ]]
then
    PATH="$HOME/.bin:$PATH"
fi

# GNAT's path
if ! [[ "$PATH" =~ "$HOME/opt/GNAT/2021/bin:" ]]
then
    PATH="$HOME/opt/GNAT/2021/bin:$PATH"
fi

# Knime's path
if ! [[ "$PATH" =~ "$HOME/.bin/knime_4.5.1:" ]]
then
    PATH="$HOME/.bin/knime_4.5.1:$PATH"
fi

# Libadalang
if ! [[ "$LD_LIBRARY_PATH" =~ "$HOME/.lib/libadalang" ]]
then
    LD_LIBRARY_PATH="$HOME/.lib/libadalang:$LD_LIBRARY_PATH"
fi

export LD_LIBRARY_PATH
export PATH
export ANSIBLE_NOCOWS=1

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Password generator
alias pswdgen="dd if=/dev/urandom bs=1 count=8 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev"
