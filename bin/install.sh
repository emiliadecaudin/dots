user_continue() {
    echo
    read -p "Press RETURN if you are ready to continue. Otherwise, press Ctrl–C to exit."
}

TEST=true

LOCAL_ROOT=${HOME}/.local${TEST+/test}
LOCAL_CONFIG="${LOCAL_ROOT}/etc"
DOTS="${LOCAL_ROOT}/dots"

echo "Welcome to Émilia Decaudin's dotfile installation script. I will first describe what this script does, then give you the opportunity to contineu with the installation or not."
echo

echo "First, I will clone https://github.com/emiliadecaudin/dots to the following path:"
echo
echo "  ${DOTS}"
echo
echo "Then, I will make the following directory links:"
echo
echo "  ln -sf ${DOTS}/direnv ${LOCAL_CONFIG}"
echo "  ln -sf ${DOTS}/git ${LOCAL_CONFIG}"
echo "  ln -sf ${DOTS}/neofetch ${LOCAL_CONFIG}"
echo "  ln -sf ${DOTS}/powerlevel10k ${LOCAL_CONFIG}"
echo "  ln -sf ${DOTS}/zsh ${LOCAL_CONFIG}"
echo
echo "Next, I will make the following file links:"
echo "Note: This is not done if $TEST is set."
echo
echo "  ln -sf ${LOCAL_CONFIG}/zsh/.zshenv ${HOME}"

user_continue

echo
echo "==> Cloning git repository into ${DOTS}..."
echo

if git clone https://github.com/emiliadecaudin/dots ${DOTS}; then
    echo
    echo "==> Done!"
else
    echo
    echo "==> 'git clone https://github.com/emiliadecaudin/dots ${DOTS}' failed. Maybe you don't have git installed?"
    exit 1
fi

echo

mkdir -p ${LOCAL_CONFIG}

ln -sf ${DOTS}/direnv ${LOCAL_CONFIG}
ln -sf ${DOTS}/git ${LOCAL_CONFIG}
ln -sf ${DOTS}/neofetch ${LOCAL_CONFIG}
ln -sf ${DOTS}/powerlevel10k ${LOCAL_CONFIG}
ln -sf ${DOTS}/zsh ${LOCAL_CONFIG}

mkdir -p ${LOCAL_ROOT}/opt/iterm2
curl -L https://iterm2.com/shell_integration/zsh -o ${LOCAL_ROOT}/opt/iterm2/iterm2_shell_integration.zsh

echo

export ZDOTDIR=${LOCAL_ROOT}/etc/zsh

export ZSH=${LOCAL_ROOT}/opt/oh-my-zsh
export ZSH_CUSTOM=${LOCAL_ROOT}/share/oh-my-zsh
export ZSH_CACHE_DIR=${LOCAL_ROOT}/var/cache/oh-my-zsh

KEEP_ZSHRC=yes eval "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
