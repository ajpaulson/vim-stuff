vim-stuff
=========

Heavily dependent on Vundle (https://github.com/gmarik/vundle).
(I have added a check to see if vundle is installed - if it isn't then it will install and update automagically)

You will also need a patched font for the powerline (https://github.com/Lokaltog/powerline-fonts)

Tagbar is dependent on exuberant C-Tags
Ultisnips is dependent on python
Ack is dependent on ack-grep
clang_complete is dependent on libclang


Install vundle, symlink vimrc to ~/.vimrc and run:
    :BundleInstall

Add gmail.vim settings to gmail-settings.vim
Add colourscheme declarations to colours.vim

hopefully that should all work.
