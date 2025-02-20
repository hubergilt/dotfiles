# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
# End of lines configured by zsh-newuser-install

#linux keys for moving with alt
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#startship
eval "$(starship init zsh)"

#nodejs
export PATH=~/node-modules/bin:$PATH

#pip3
#export PATH=~/.local/bin:$PATH

#modulefiles
#module load ~/modulefiles/nvim/0.10.0

#nvim
export PATH=/opt/nvim/0.10.0/bin:$PATH

autoload -U compinit promptinit


export PATH=/home/huber/.meteor:$PATH
