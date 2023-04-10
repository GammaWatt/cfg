# .bash_profile                                    
                                                   
# Get the aliases and functions                    
if [ -f ~/.bashrc ]; then                          
        . ~/.bashrc                                
fi                                                 
                                                   
# User specific environment and startup programs   
                                                   
PATH=$PATH:$HOME/bin                

export PATH

PS1="\[\e]0;\w\a\]\n\[\e[31m\]\u@\h \[\e[36m\]\w\n\[\e[33m\]\$(git_branch)\[\e[0m\]\n$"

### Make all terminals use the same ssh-agent process     
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.$USER.sock
                                                          
ssh-add -l 2>/dev/null >/dev/null                         
### Make sure that one ssh-agent is running                            
if [ $? -ge 2 ]                                           
then                                                            
        ssh-agent -a $SSH_AUTH_SOCK >/dev/null            
fi                                                        
