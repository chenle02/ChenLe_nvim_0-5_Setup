
set dictionary+=/usr/share/dict/words
let g:dict_leave_pw = 0
noremap <space>? :Dict <C-r><C-w><CR>
let g:dict_hosts = [
    \["dict.org", [
    \"gcide",
    \"wn",
    \"moby-thesaurus",
    \"elements",
    \"vera",
    \"jargon",
    \"foldoc",
    \"easton",
    \"hitchcock",
    \"bouvier",
    \"devil",
    \"world02",
    \"gaz2k-counties",
    \"gaz2k-places",
    \"gaz2k-zips",
    \"fd-fra-eng",
    \"fd-eng-lat",
    \"fd-lat-eng",
    \"fd-eng-fra",
    \"english",
    \"trans"]]
\]
  " \["dict.org", ["all"]],
  " \["www.thesaurus.com", []],
  " \["www.merriam-webster.com/thesaurus", []]
