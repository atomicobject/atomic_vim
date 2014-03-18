## vim-writeroom ##

### A vim WriteRoom Clone ###

vim-writeroom is a [pathogen](https://github.com/tpope/vim-pathogen) style vim plugin that will mimic the full-screen, distraction-free interface of [WriteRoom](http://www.hogbaysoftware.com/products/writeroom). It is designed to be used alone or work in conjunction with other plugins.

### Use ###

By default, the `<F5>` key is mapped to toggle vim-writeroom on and off. If this key is already bound, vim-writeroom will not override it. The line below is used internally to set up the binding. You can mimic the binding with your own key or sequence in your .vimrc file to customize its use.

    nnoremap <F5> :call VimWriteRoom()<CR>

_Note_: there is a bug in MacVim on Lion that can create display issues in full-screen where the OS native background is displayed instead of vim's background. To fix this problem in the meantime, you can try running this command from your terminal window:

    defaults write org.vim.MacVim MMNativeFullScreen 0
    
The following are a number of configuration variables that can be set to customize your vim-writeroom experience:

    g:vimwriteroom = set to disable plugin
    g:vimwriteroomcolorscheme = colorscheme to show in writeroom mode


### Roadmap ###

* ~~Make `<F5>` or any call to `VimWriteRoom()` toggle the experience back and forth~~
* ~~Add support for configurable color options and various colorschemes~~
* Add variable to use determine the use of the default <F5> toggle mapping
* Fix [full-screen issues in Lion](http://code.google.com/p/macvim/issues/detail?id=364)
* Expand help documents

### Screenshot ###

![Example of Use](http://jamestomasino.com/images/vim-writeroom.jpg)


### Credits ####

vim-writeroom is written by [James Tomasino](https://github.com/jamestomasino). [![endorse](http://api.coderwall.com/jamestomasino/endorsecount.png)](http://coderwall.com/jamestomasino)

It was inspired, and much of the original code was lifted, from a [blog post](https://mutelight.org/vim-is-writeroom-level-2) by Brandur.

Much thanks also goes to [Steve Francia](https://github.com/spf13) for his amazing [spf13-vim](https://github.com/spf13/spf13-vim), which helped me gain an understanding of vimL and learn to write a plugin.
