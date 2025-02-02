# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

######################
####### ALİAS ########
######################

alias nvimConfig="cd ~/.config/nvim/lua" # goes into the nvim config folder
alias zshrc="nvim ~/.zshrc" # goes into to zsh config file
alias mkdir='mkdir -p' # create directories and their parent directories
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias py="python"
alias tmp="/tmp"
alias pterm="sudo -u postgres psql"
alias lncrawli="docker run -v ~/Lightnovels:/home/appuser/app/Lightnovels -it lncrawl"








######################
###### FUNCTİON ######
######################


# if not have pyton env. create virtual environment if have activate it
activate_env() {
    ENV_DIR=".env"

    # Check if the directory exists, if not, create a new virtual environment
    if [ ! -d "$ENV_DIR" ]; then
        echo "No virtual environment found. Creating a new virtual environment at $ENV_DIR..."
        python3 -m venv "$ENV_DIR"
    fi

    # Check if the directory contains a valid virtual environment
    if [ -f "$ENV_DIR/bin/activate" ]; then
        source "$ENV_DIR/bin/activate"
        echo "Activated virtual environment at $ENV_DIR"
    else
        echo "Error: $ENV_DIR does not contain a valid Python virtual environment."
    fi
}





# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
