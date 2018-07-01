pkgs : pkgs.vim_configurable.customize {
  name = "vim";
  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
  vimrcConfig.vam.pluginDictionaries = [
    { names = ["Syntastic" "ctrlp" "vim-multiple-cursors"]; }
  ];
  vimrcConfig.customRC = ''
    function! TrimWhiteSpace()
      %s/\s\+$//e
    endfunction

    syntax enable
    set guifont=Iosevka
    set background=dark
    set encoding=utf-8

    set tabstop=2
    set softtabstop=2
    set shiftwidth=2

    set number
    set relativenumber
    set autoindent
    set autoread
    set backspace=indent,eol,start
    set complete-=i
    set conceallevel=2
    set dir=/tmp
    set expandtab
    set hlsearch
    set incsearch
    set laststatus=2
    set nojoinspaces
    set nospell
    set nowrap
    set showmatch
    set showmode
    set smarttab

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    filetype plugin indent on

    map \ :

    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
    autocmd BufWritePre * call TrimWhiteSpace()
  '';
}
