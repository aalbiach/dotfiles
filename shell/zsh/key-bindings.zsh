# All bindings can be found https://www.zsh.org/mla/users/2014/msg00266.html

# Smart paste: handle multi-line paste and auto-quote pasted URLs
autoload -Uz bracketed-paste-magic && zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic
