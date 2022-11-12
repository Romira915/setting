bass source ~/.profile
set -g theme_color_scheme brgrey
set -g theme_display_date no
function fish_user_key_bindings
#  bind \cg peco_select_ghq_repository
  bind \cg cd_ghq_sk
  bind \cb\cr zoxide_zi
  bind \cb\cg gh_repo_get
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
zoxide init fish | source

function zoxide_zi
  zi
  commandline -f repaint
end

function cd_ghq_sk
  ghq list | sk | read REPO && cd (ghq root)/$REPO
  commandline -f repaint
end

function gh_repo_get
  gh repo list $argv | sk | awk '{print $1}' | read REPO && ghq get -p $REPO
  commandline -f repaint
end

source ~/.config/mcfly/mcfly.fish

switch (uname)
case Linux
  bass eval (ssh-agent) &>/dev/null
case Darwin
end