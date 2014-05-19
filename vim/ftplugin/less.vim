" function LessToCss()
"	let current_file = shellescape(expand('%:p'))
"	let filename = shellescape(expand('%:r'))
"	let command = "silent !lessc " . current_file . " " . filename . ".css"
"	execute command
"	let command = "silent !autoprefixer " . filename . ".css"
"	execute command
"endfunction
"au BufWritePost,FileWritePost *.less call LessToCss()
