syn match list '\s*-' oneline
syn match NoteTodo ' \[[ |\.|x]\] ' oneline
syn match NoteTodoPending '\[\.\]'ms=s+1,me=e-1 containedin=NoteTodo conceal cchar=•
syn match NoteTodoComplete '\[x\]'ms=s+1,me=e-1 containedin=NoteTodo conceal cchar=✔
syn region NoteTag start="\s@" end="@|\s\|$" oneline

syn match TodoProject /\s+\S\+/ oneline

syn match MdId /\[.*\]\((.*)\)\@=/ oneline contains=MdDel
syn match MdDel /[\[|\]]/ oneline conceal contained
syn match MdLink /\(\[.*\]\)\@<=(.*)/ oneline conceal

highlight link list Grey
highlight link NoteTodo Grey
highlight link NoteTag TSEnvironment

hi def link MdId Function
hi def link MdDel Function
hi def link MdLink TSEnvironment
hi def link TodoProject Statement
