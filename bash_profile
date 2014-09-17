
export PS1="\w @ \h (\u) => "

export EDITOR=/usr/bin/vim

alias cp='cp -v'                            
alias s='sudo'				               	
alias please='sudo'             # :-)
alias mv='mv -v'                            
alias mkdir='mkdir -pv'                     
alias l='ls -FGlAhp'                        
alias ls='ls -FGlAhp'                       
cd() { builtin cd "$@"; l; }               
alias ..='cd ../'                           
alias edit='vim -p'                         
alias vim='vim -p'                          
#alias finder='open -a Finder ./'  
alias cls='clear'               # I always do cls in dos so I have to have this here
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
#alias plantu='lsof -n -i4'
#alias plantu='netstat -plantu'     # don't forget sudo!

#spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#alias printroute='netstat -r'
#alias printroute='route'       #this is kind of pointless, but I tend to forget the OSX version so I added the linux version for good measure


