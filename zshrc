autoload -U compinit && compinit
autoload -U select-word-style && select-word-style bash
setopt appendhistory     # Append history to the history file (no overwriting)
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed
setopt prompt_subst

HISTSIZE=5000
HISTFILE=~/.cache/zsh_history
SAVEHIST=5000
PATH=~/.bin:$PATH
COMMON_PROMPT_SYMBOL="➤"
PROMPT='%n@%m %~ $(git_prompt) %F{blue}$COMMON_PROMPT_SYMBOL%f '

INCLUDES=(
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ~/.zshrc.local
)

for i in $INCLUDES; do
    if [ -f $i ];  then
        source $i
    fi
done

git_prompt() {
  branch=$(git branch --show-current 2>/dev/null)

  if [ $branch ]; then
    modified=$(git status --porcelain 2>/dev/null | wc -l)
    if [ $modified -gt 0 ]; then
        branch="$branch:$modified"
    fi
    echo "($branch)"
  fi
}

alias ls='ls --color=auto'
