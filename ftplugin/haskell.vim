" http://www.haskell.org/haskellwiki/Vim
"
" 2.1 Module Sections
" The following code prompts for a name, and places a section with that name at current position, when key sequence "--s":

let s:width = 80

function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"

endfunction

nmap <silent> --s "=HaskellModuleSection()<CR>gp

" Like so:
"
" --------------------------------------------------------------------------------
" --  my section


" 2.2 Module Headers
"
" The following code prompts for module name, a note, a description of module, and places a module comment at top, when key sequence "--h":

let s:width = 80


function! HaskellModuleHeader(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Module: ")
    let note = 1 < a:0 ? a:2 : inputdialog("Note: ")
    let description = 2 < a:0 ? a:3 : inputdialog("Describe this module: ")
    
    return  repeat('-', s:width) . "\n" 
    \       . "-- | \n" 
    \       . "-- Module      : " . name . "\n"
    \       . "-- Note        : " . note . "\n"
    \       . "-- \n"
    \       . "-- " . description . "\n"
    \       . "-- \n"
    \       . repeat('-', s:width) . "\n"
    \       . "\n"

endfunction


nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>

" like so:
" 
" --------------------------------------------------------------------------------
" -- | 
" -- Module      : MyModule
" -- Note        : This is a preview
" -- 
" -- This is an empty module, to show the headercomment produced. 
" -- 
" --------------------------------------------------------------------------------
" 
