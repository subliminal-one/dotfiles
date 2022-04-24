let b:did_ftplugin = 1

function! MDFold() abort
    return luaeval(printf('require("flatliner").fold(%d)', v:lnum))
endfunction

function! MDFoldText() abort
    return luaeval(printf('require("flatliner").foldtext(%d, %d)', v:foldstart, v:foldend))
endfunction

setlocal nospell
setlocal foldmethod=expr
setlocal foldexpr=MDFold()
setlocal foldtext=MDFoldText()
setlocal foldenable
setlocal wrap
setlocal textwidth=0
setlocal formatoptions=tcqr
setlocal linebreak
setlocal showbreak=
setlocal breakindent
setlocal breakindentopt=min:20,shift:2
setlocal modelineexpr
setlocal tabstop=2 softtabstop=2 shiftwidth=2

nmap <buffer><silent> gti :lua require('boxer').open()<CR>
nmap <buffer><silent> gtp :lua require('boxer').pending()<CR>
nmap <buffer><silent> gto :lua require('boxer').complete()<CR>
nmap <buffer><silent> gtd :lua require('boxer').delete()<CR>
nmap <buffer><silent> gh :lua require('local').home()<CR>
