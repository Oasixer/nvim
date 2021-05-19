" ts / tabstop
"     number of spaces that a <Tab> displays as
"
" et / expandtab
"     Whether to convert tab to spaces based on ts

" sw / shiftwidth
"     = Number of spaces to use for each step of (auto)indent.
"     Used for <<, >>, etc
"
" sta / smarttab
"     * default on
"     When on, a <Tab> in front of a line inserts blanks according to
"     'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
"     <BS> will delete a 'shiftwidth' worth of space at the start of the
"     line.
"     When off, a <Tab> always inserts blanks according to 'tabstop' or
"     'softtabstop'.  'shiftwidth' is only used for shifting text left or
"     right |shift-left-right|.
"     What gets inserted (a <Tab> or spaces) depends on the 'expandtab'
"
" si / smartindent
"     * default off
"     autoindent when when starting new line.
"     uses sw and not ts for some reason
"     indentexpr is a more advanced version where you pass in a custom
"     function

setlocal ts=2 sw=2 expandtab

