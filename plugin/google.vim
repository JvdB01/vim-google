command! -nargs=1 Google call GoogleFunc(<f-args>)

function! GoogleFunc(query)
    execute 'vs /tmp/querytempfile'
    execute 'normal i'.a:query 
    execute 's/\ /+/g'
    execute 's/&/\\\%26'
    execute 'normal I!elinks google.com/search?q='
    execute 'w'
    execute 'source %'
    execute 'q'
    execute '!rm /tmp/querytempfile'
endfunction
