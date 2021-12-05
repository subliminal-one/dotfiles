function! MDFold()
    return luaeval(printf('require"flatliner".fold(%d)', v:lnum))
endfunction

function! MDFoldText()
    return luaeval(printf('require"flatliner".foldtext(%d, %d)', v:foldstart, v:foldend))
endfunction

setlocal spell
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
"setlocal foldlevelstart=0
setlocal tabstop=4 softtabstop=4 shiftwidth=4

let g:markdown_syntax_conceal=1
let g:markdown_fenced_languages = ['php', 'sql', 'javascript']

nmap <buffer><silent> gti :lua require('boxer').open()<CR>
nmap <buffer><silent> gtp :lua require('boxer').pending()<CR>
nmap <buffer><silent> gto :lua require('boxer').complete()<CR>
nmap <buffer><silent> gtd :lua require('boxer').delete()<CR>
nmap <buffer><silent> gh :lua require('local').home()<CR>
nmap <buffer><silent> gf :lua require('local').follow_link()<CR>
nmap <buffer><silent> <leader>sw :normal ciw``<Esc>PE
