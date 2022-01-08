# Aliases

alias neofetch="~/.neofetch/neofetch --source ~/.config/neofetch/dreamhost.txt --ascii_distro Xubuntu"

# Functions

function fix_node() {
    setfattr -n user.pax.flags -v "mr" $(find ~/.vscode-server -type f -iname "node" -o -iname "npm" -o -iname "npx")
}

# iTerm2 Integration

export iterm2_hostname=data.edecaud.in
