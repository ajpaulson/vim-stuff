vim-stuff
=========

Heavily dependent on Vundle (https://github.com/gmarik/vundle).
(I have added a check to see if vundle is installed - if it isn't then it will install and update automagically)

Tagbar is dependent on exuberant C-Tags
Ultisnips is dependent on python
Ack is dependent on ack-grep
clang_complete is dependent on libclang


Install vundle, symlink vimrc to ~/.vimrc and run:
    :BundleInstall

(**NOTE** Vim >7.3 can also source ~/.vim/vimrc making symlink unnecessary)

Add colourscheme declarations to colours.vim
Add folding declarations to folds.vim

hopefully that should all work.
