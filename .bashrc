# .bashrc                    
                             
# Source global definitions  
if [ -f /etc/bashrc ]; then  
        . /etc/bashrc        
fi                           

# User specific aliases and functions

export EDITOR="vim -X"  
                        
alias tmus="tmux"       
alias vim="vim -X"                
alias vimr="vim -RX"              
alias vimdiff="vimdiff -X"        
alias ls="ls --color=auto"        
alias la="ls -A --color=auto"     
alias ll="ls -l --color=auto"     
alias lla="ls -lA --color=auto"   
alias l.="ls -d .* --color=auto"  
alias grep="grep --color=auto"    
alias less="less -R"              
alias ag="ag --ignore tags --ignore cscope.out"          
alias genctags="ctags -R * --exclude=.git --exclude=.svn"
alias gencscope="cscope -Rbqku"                          
                                                         
alias gentags="genctags && gencscope"    

function git_branch {                                                             
   branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')    
   if [[ -z "${branch}" ]]                                                        
   then                                                                           
      branch="---"                                                                
   fi                                                                             
   echo $branch                                                                   
}                                                                                 
