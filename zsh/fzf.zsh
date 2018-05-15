# Setup fzf
# ---------
if [[ ! "$PATH" == */home/achrome/.fzf/bin* ]]; then
  export PATH="$PATH:/home/achrome/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/achrome/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/achrome/.fzf/shell/key-bindings.zsh"

