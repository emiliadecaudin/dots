'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
    emulate -L zsh -o extended_glob

    unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

    autoload -Uz is-at-least && is-at-least 5.1 || return

    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        os_icon                 # os identifier
        dir                     # current directory
        vcs                     # git status

        # =========================[ Line #2 ]=========================
        newline                 # \n
    )

    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        status                  # exit code of the last command
        command_execution_time  # duration of the last command
        background_jobs         # presence of background jobs
        direnv                  # direnv status (https://direnv.net/)
        asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
        virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
        nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
        context                 # user@hostname
        vim_shell               # vim shell indicator (:sh)
        vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
        todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
        taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
        time                    # current time

        # =========================[ Line #2 ]=========================
        newline                 # \n
    )

    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
    typeset -g POWERLEVEL9K_ICON_PADDING=none
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%238F╭─'
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%238F├─'
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%238F╰─'

    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=

    if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
        typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=238
        typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
        typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
    fi

    typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
    typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
    typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
    typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'

    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
    typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

    #################################[ os_icon: os identifier ]##################################

    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7

    ##################################[ dir: current directory ]##################################

    typeset -g POWERLEVEL9K_DIR_BACKGROUND=4
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=254

    typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
    typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=250

    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true

    local anchor_files=(
        .bzr
        .citc
        .git
        .hg
        .node-version
        .python-version
        .go-version
        .ruby-version
        .lua-version
        .java-version
        .perl-version
        .php-version
        .tool-version
        .shorten_folder_marker
        .svn
        .terraform
        CVS
        Cargo.toml
        composer.json
        go.mod
        package.json
        stack.yaml
    )

    typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50

    typeset -g POWERLEVEL9K_DIR_HYPERLINK=true
    typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3


    typeset -g POWERLEVEL9K_DIR_CLASSES=(
        '*/dsausa(|/*)'  DSA     ''
        '~(|/*)'       HOME     ''
        '*'            DEFAULT  '')

    typeset -g POWERLEVEL9K_DIR_HOME_VISUAL_IDENTIFIER_EXPANSION=''
    typeset -g POWERLEVEL9K_DIR_DSA_VISUAL_IDENTIFIER_EXPANSION=' '

    typeset -g POWERLEVEL9K_DIR_PREFIX=''

    #####################################[ vcs: git status ]######################################

    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
    typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=3
    typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=' '

    function my_git_formatter() {
        emulate -L zsh

        if [[ -n $P9K_CONTENT ]]; then
            typeset -g my_git_format=$P9K_CONTENT
            return
        fi

        local       meta='%7F' # white foreground
        local      clean='%0F' # black foreground
        local   modified='%0F' # black foreground
        local  untracked='%0F' # black foreground
        local conflicted='%1F' # red foreground

        local res

        if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
            local branch=${(V)VCS_STATUS_LOCAL_BRANCH}

            (( $#branch > 32 )) && branch[13,-13]="…"
            res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
        fi

        if [[ -n $VCS_STATUS_TAG
            && -z $VCS_STATUS_LOCAL_BRANCH
            ]]; then
            local tag=${(V)VCS_STATUS_TAG}
            (( $#tag > 32 )) && tag[13,-13]="…"
            res+="${meta}#${clean}${tag//\%/%%}"
        fi

        [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&
        res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

        if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
            res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
        fi

        if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
            res+=" ${modified}wip"
        fi

        (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
        (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
        (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
        (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
        (( VCS_STATUS_STASHES        )) && res+=" ${clean} ${VCS_STATUS_STASHES}"
        [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
        (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted} ${VCS_STATUS_NUM_CONFLICTED}"
        (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified} ${VCS_STATUS_NUM_STAGED}"
        (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified} ${VCS_STATUS_NUM_UNSTAGED}"
        (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
        (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

        typeset -g my_git_format=$res
    }

    functions -M my_git_formatter 2>/dev/null

    typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

    typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

    typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

    typeset -g POWERLEVEL9K_VCS_PREFIX='on '

    typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

    ##########################[ status: exit code of the last command ]###########################

    typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

    typeset -g POWERLEVEL9K_STATUS_OK=true
    typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0

    typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0

    typeset -g POWERLEVEL9K_STATUS_ERROR=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1

    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
    typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1

    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

    ###################[ command_execution_time: duration of the last command ]###################

    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3

    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

    #######################[ background_jobs: presence of background jobs ]#######################

    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0

    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

    #######################[ direnv: direnv status (https://direnv.net/) ]########################

    typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=3
    typeset -g POWERLEVEL9K_DIRENV_BACKGROUND=0

    ###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############

    typeset -g POWERLEVEL9K_ASDF_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_BACKGROUND=7

    typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)
    typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false
    typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true
    typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

    typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND=1

    typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND=4

    typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND=4

    typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND=2

    typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND=208

    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND=5

    typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND=4

    typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND=4

    typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=1
    typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND=7

    typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND=4

    typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND=1

    typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND=5

    typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND=6

    typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND=5

    typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND=3

    typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_JULIA_BACKGROUND=2

    ###########################[ vim_shell: vim shell indicator (:sh) ]###########################

    typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND=2

    ###########[ vi_mode: vi mode (you don't need this if you've enabled prompt_char) ]###########

    typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND=0

    typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
    typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=2

    typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
    typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=4

    typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
    typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=3

    typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
    typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=8

    ##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############

    typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=0
    typeset -g POWERLEVEL9K_TASKWARRIOR_BACKGROUND=6

    ##################################[ context: user@hostname ]##################################

    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0

    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=2
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0

    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0

    typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

    typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION=' '
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_VISUAL_IDENTIFIER_EXPANSION=''
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_VISUAL_IDENTIFIER_EXPANSION=' '

    ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###

    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=4

    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
    typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

    ############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############

    typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=2
    typeset -g POWERLEVEL9K_NODEENV_BACKGROUND=0

    typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
    typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=

    ####################################[ time: current time ]####################################

    typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=7

    typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
    typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true

    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

    (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
