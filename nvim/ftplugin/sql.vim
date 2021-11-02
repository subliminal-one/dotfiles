setlocal foldmethod=marker
setlocal foldmarker={{{,}}}
setlocal foldenable
setlocal foldlevel=0
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
setlocal textwidth=120

nmap <buffer><silent> gh :lua require('local').home()<CR>
