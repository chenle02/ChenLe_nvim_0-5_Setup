let g:lexical#thesaurus = ['~/Dropbox/mydotfiles/dics/mthesaur.txt',]
let g:lexical#thesaurus_key = '<space>t'
command! -nargs=0 LexMed call lexical#init({
                  \ 'spell': 1,
                  \ 'spelllang':  ['en',],
                  \ 'dictionary': ['/usr/share/dict/words',
                  \               ],
                  \ 'thesaurus':  ['~/Dropbox/mydotfiles/dics/mthesaur.txt',
                  \               ],
                  \ 'spellfile':  ['~/bin/vim/spell/en.utf-8.add',
                  \               ],
                  \ })
