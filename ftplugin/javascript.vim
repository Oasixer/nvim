" log selected var w/ name in quotes in second statement
command! Clog norm <Esc>oconsole.log("<Esc>pa");<Esc>oconsole.log(<Esc>pa);<Esc>
iabbrev <buffer> clog console.log(
iabbrev <buffer> clog2 $: console.log(`: ${}`);
iabbrev <buffer> foreach myArray.forEach(function (i, n) {<CR><CR>});

