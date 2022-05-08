# .bashrc

# The prompt

END_COLOR="\e[0m"
USER_NAME_COLOR="\e[0;33m"
MODE_INDICATOR_COLOR="\e[1;31m"
BRACKETS_COLOR="\e[2;35m"
WORKING_DIR_COLOR="\e[0;32m"
PROMPT_COLOR="\e[1;31m"

USER_NAME_P="$USER_NAME_COLOR\u"
MODE_P="$MODE_INDICATOR_COLOR\$"
L_BRACKET_P="$BRACKETS_COLOR["
R_BRACKET_P="$BRACKETS_COLOR]"
WORKING_DIR_P="$WORKING_DIR_COLOR\w"
PROMPT_P="$PROMPT_COLOR >"

export PS1="\n$USER_NAME_P $MODE_P $L_BRACKET_P$WORKING_DIR_P$R_BRACKET_P\n$PROMPT_P $END_COLOR"

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
if ! [[ "$PATH" =~ "$HOME/.games/Minecraft:" ]]
then
    PATH="$HOME/.games/Minecraft:$PATH"
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

# Knime's path knime_4.5.2
if ! [[ "$PATH" =~ "$HOME/.bin/knime_4.5.2:" ]]
then
    PATH="$HOME/.bin/knime_4.5.2:$PATH"
fi

# Libadalang
if ! [[ "$LD_LIBRARY_PATH" =~ "$HOME/.lib/libadalang" ]]
then
    LD_LIBRARY_PATH="$HOME/.lib/libadalang:$LD_LIBRARY_PATH"
fi

# libiconv
if ! [[ "$LD_LIBRARY_PATH" =~ "/usr/local/lib" ]]
then
    LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
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

source ~/.dotfiles/setAdaProjectFilesForAdaModeBuild.sh
