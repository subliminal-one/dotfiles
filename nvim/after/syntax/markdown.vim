syn region NoteTag start="\s@" end="@|\s\|$" oneline
syn match TodoProject /\s+\S\+/ oneline

hi def link NoteTag Statement
hi def link TodoProject TSTextReference
