"Super janky fix to autocomplete via pressing tab not working in markdown / vimwiki files

inoremap <silent><expr><buffer> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
