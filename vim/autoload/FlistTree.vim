" FlistTree.vim
"  Maintainer: Charles E. Campbell <NdrOchipS@PcampbellAfamily.Mbiz>
"  Date:       May 08, 2013
"  Version:    9c	ASTRO-ONLY
"redraw!|call DechoSep()|call inputsave()|call input("Press <cr> to continue")|call inputrestore()
" ---------------------------------------------------------------------
" Load Once: {{{1
if exists("g:loaded_FlistTree") || &cp
 finish
endif
let g:loaded_FlistTree = "v9c"
let s:keepcpo          = &cpo
set cpo&vim
"DechoTabOn

" ---------------------------------------------------------------------
"  Public Interface: {{{1
if has("gui_running")
 menu DrChip.FlistTree.FlistTree\ filename		:FlistTree<CR>
 menu DrChip.FlistTree.Go\ up\ one\ level<tab>[^	[^
 menu DrChip.FlistTree.Go\ down\ one\ level<tab>]v	]v
 menu DrChip.FlistTree.Go\ to\ prv\ same\ depth<tab>[\.	[\.
 menu DrChip.FlistTree.Go\ to\ nxt\ same\ depth<tab>]\.	]\.
endif

" ---------------------------------------------------------------------
"  Options: {{{1
" allow user to override use of "ctags" with whatever tagging program is preferred
if !exists("g:FlistTreeTags")
  let g:FlistTreeTags="ctags"
endif
if !exists("g:FlistTreeOptions")
  let g:FlistTreeOptions="-asx"
"  call Decho("set up default g:FlistTreeOptions=".g:FlistTreeOptions)
endif
if !exists("g:FlistTreeWidth")
 let g:FlistTreeWidth=25
" call Decho("set up default g:FlistTreeWidth=".g:FlistTreeWidth)
endif

" ---------------------------------------------------------------------
"  Functions: {{{1
" FlistTree#FlistTree: Generate graphtree window using flist program {{{2
fun! FlistTree#FlistTree(...)
"  call Dfunc("FlistTree#FlistTree(a:1<".a:1.">) in win#".winnr())
  if &ro == 1
   if bufname("%") =~ '^FlistTree<'
    sil! q!
   else
    errormsg "this window is readonly!"
"    call Dret("FlistTree#FlistTree : warning issued")
    return
   endif
  endif

  if a:1 != ""
"   call Decho("using glob(".a:1.") to get flistfiles")
   let flistfiles= substitute(glob(a:1),'\n',' ','g')
"   call Decho("a:1 flistfiles<".flistfiles.">")
  else
"   call Decho("using expand(%) to get flistfiles")
   let flistfiles=expand("%")
"   call Decho("expand: flistfiles<".flistfiles.">")
  endif

  " Generate vertically split window
"  call Decho("generate vertically split empty window using win#".winnr())
  let srcfile= bufname("%")
  if &spr 
   set nospr
   vsp
   enew
   set spr
  else
   vsp
   enew
  endif
  setl bt=nofile nomod ro noswf
  exe 'keepj file FlistTree<'.srcfile.">"
  let b:flisttree= winnr()

  " Generate tree (and tags) for given file(s)
"  call Decho("building graphtree in left window (win#".winnr().")")
  if g:FlistTreeTags != "" && !filereadable("tags")
   " generate tags
"    call Decho("applying ".g:FlistTreeTags." to <".flistfiles.">")
    sil exe "!".g:FlistTreeTags." ".flistfiles
  endif
  "  Put graphtree in left window
"  call Decho("applying flist to <".flistfiles.">")
  sil exe "r !flist -Tg ".g:FlistTreeOptions." ".flistfiles
  exe "norm! ggdd"
  set nomod
  if exists("g:winManagerWidth")
   exe g:winManagerWidth.'wincmd |'
  else
   exe g:FlistTreeWidth.'wincmd |'
  endif

  " GraphTree maps
"  call Decho("setting up GraphTree maps in win#".winnr())
  nnoremap <buffer>          <cr>		:call <SID>FlistOpen()<cr>
  nnoremap <buffer>          <right>		:call <SID>FlistOpen()<cr>
  nnoremap <buffer> <script> <2-LeftMouse>	:call <SID>FlistOpen()<cr>

  nnoremap <buffer> <script> <LocalLeader>[[	:call <SID>FlistNext(0)<cr>
  nnoremap <buffer> <script> <LocalLeader>]]	:call <SID>FlistNext(1)<cr>
  nnoremap <buffer> <script> [^			:call <SID>FlistNext(4)<cr>
  nnoremap <buffer> <script> ]v			:call <SID>FlistNext(5)<cr>
                                                         
  nnoremap <buffer> <script> <c-up>		:call <SID>FlistNext(0)<cr>
  nnoremap <buffer> <script> <c-down>		:call <SID>FlistNext(1)<cr>
  nnoremap <buffer> <script> <s-up>		:call <SID>FlistNext(2)<cr>
  nnoremap <buffer> <script> <s-down>		:call <SID>FlistNext(3)<cr>
  nnoremap <buffer> <script> <m-up>		:call <SID>FlistNext(4)<cr>
  nnoremap <buffer> <script> <m-down>		:call <SID>FlistNext(5)<cr>

  " SourceSide maps
  let flisttree_winnr = winnr()
  let eikeep          = &ei
  set ei=all
  call s:SourceSide()
"  call Decho("setting up SourceSide maps in win#".winnr())
  noremap <buffer> <script> <LocalLeader>[[ :call <SID>FlistAdjust(0)<CR>
  noremap <buffer> <script> <LocalLeader>]] :call <SID>FlistAdjust(1)<CR>
  if exists("g:FlistTree_hasmapto") && g:FlistTree_hasmapto
"   call Decho("case g:FlistTree_hasmapto : conditional <[cs]-up/down> maps")
   if !hasmapto('<c-up>')  | noremap <buffer> <script> <c-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(0)<cr>|endif
   if !hasmapto('<c-down>')| noremap <buffer> <script> <c-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(1)<cr>|endif
   if !hasmapto('<s-up>')  | noremap <buffer> <script> <s-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(2)<cr>|endif
   if !hasmapto('<s-down>')| noremap <buffer> <script> <s-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(3)<cr>|endif
   if !hasmapto('<m-up>')  | noremap <buffer> <script> <m-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(4)<cr>|endif
   if !hasmapto('<m-down>')| noremap <buffer> <script> <m-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(5)<cr>|endif
  else
"   call Decho("case !g:FlistTree_hasmapto : unconditional <[cs]-up/down> maps")
   nnoremap <buffer> <script> <c-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(0)<cr>
   nnoremap <buffer> <script> <c-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(1)<cr>
   nnoremap <buffer> <script> <s-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(2)<cr>
   nnoremap <buffer> <script> <s-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(3)<cr>
   nnoremap <buffer> <script> <m-up>   :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(4)<cr>
   nnoremap <buffer> <script> <m-down> :call <SID>GraphtreeSide()<bar>call <SID>FlistNext(5)<cr>
  endif
"  call Decho("flisttree_winnr#".flisttree_winnr)
  exe flisttree_winnr."wincmd w"
  let &ei= eikeep

  " set up some small syntax highlighting for graphtree window
"  call Decho("setting up syntax highlighting for graphtree window#".winnr())
  syn clear
  syn match flistLevel "[-|]"
  syn match flistParen "[()]"
  hi link flistLevel	Delimiter
  hi link flistParen	Operator

  redraw!
  echo "<c-up>,<c-down> func at same depth   <s-up> func at calling depth   <s-down> func at deeper depth"

"  call Dret("FlistTree#FlistTree")
endfun

" ---------------------------------------------------------------------
" s:FlistOpen: show function in source window {{{2
fun! s:FlistOpen()
"  call Dfunc("s:FlistOpen()")

  " get function name from under cursor
  let flistfunc=expand("<cword>")
  if flistfunc =~ '[()*-| ]'
   norm! 0f-l
   let flistfunc=expand("<cword>")
  endif
"  call Decho("flistfunc<".flistfunc.">")

  " highlight associated line
"  call Decho('exe 3match PreProc /\%'.line('.').'l\K\k*/')
  exe '3match PreProc /\%'.line('.').'l\K\k*/'

  " tag to function in window to right
  call s:SourceSide()
  exe "ta ".flistfunc

  " unfold and place function at top-of-window
  if has("folding") && foldclosed('.') > 0
"   call Decho("foldclosed on line#".line("."))
   norm! zMzx
  endif
  exe "norm! z\<CR>"
  echo "<c-up>,<c-down> func at same depth   <s-up> func at calling depth   <s-down> func at deeper depth"

"  call Dret("s:FlistOpen")
endfun

" ---------------------------------------------------------------------
" s:FlistAdjust: handle moving from code window to graphtree window {{{2
fun! s:FlistAdjust(dir)
"  call Dfunc("s:FlistAdjust(dir=".a:dir.")")
  set lz

  " extract name of function
  if a:dir == 0
   exe "norm! [[z.ma ?)\<CR>"
   exe "norm! %?\\a\<CR>"
  else
   exe "norm! ]]z.ma ?)\<CR>"
   exe "norm! %?\\a\<CR>"
  endif
  let fname=expand("<cword>")
"  call Decho("fname<".b:fname.">")

  " adjust lhs
  exe "norm! \<c-w>h"
  if a:dir == 0
   exe "norm! ?".fname."\<cr>"
  else
   exe "norm! /".fname."\<cr>"
  endif

  exe "norm! z.\<c-w>l`a"
  set nolz
" call Dret("s:FlistAdjust")
endfun

" ---------------------------------------------------------------------
" s:FlistNext: handle moving at same call level in graphtree window {{{2
fun! s:FlistNext(dir)
"  call Dfunc("s:FlistNext(dir=".a:dir.")")
  " start in the graphtree buffer
  if winnr() != 1
   call s:GraphtreeSide()
  endif

  "  determine current function depth
  norm! $F(b
  let curdepth= (col(".")-1)/2
"  call Decho("curdepth=".curdepth)
  if curdepth >= 2
   let samelvlsrch = '^\(| \)\{'.(curdepth-1).'}|-\a'
   let uplvlsrch   = '^\(| \)\{'.(curdepth-2).'}|-\a' 
   let downlvlsrch = '^\(| \)\{'.(curdepth).'}|-\a'
  elseif curdepth == 1
   let samelvlsrch = '^|-\a'
   let uplvlsrch   = '^\a' 
   let downlvlsrch = '^| |-\a'
  else
   let samelvlsrch = '^\a'
   let uplvlsrch   = ""
   let downlvlsrch = '^|-\a'
  endif
"  call Decho("samelvlsrch<".samelvlsrch.">")
"  call Decho("uplvlsrch  <".uplvlsrch.">")
"  call Decho("downlvlsrch<".downlvlsrch.">")
  
  " <c-up>: moving upwards to a function at the same level
  if a:dir == 0
"   call Decho("<c-up>: moving upwards to a function at the same level")
   norm! 0
   let linesame = search(samelvlsrch,'bnW')
   let lineup   = search(uplvlsrch,'bnW')
   if lineup < linesame
    exe linesame
   elseif lineup != 0
    let containerfunc= substitute(getline(lineup),'[^a-zA-z_]','','g')
    let msg= "no preceding function calls at this level in ".containerfunc."()"
    echo msg | sleep 2
"    call Dret("s:FlistNext : ".msg)
    return
   endif

  " <c-down>: moving downwards to a function at the same level
  elseif a:dir == 1
"   call Decho(" <c-down>: moving downwards to a function at the same level")
   norm! $
   let linesame = search(samelvlsrch,'nW')
   let lineup   = search(uplvlsrch,'nW')
   if lineup > linesame
    exe linesame
   elseif lineup != 0
    let lineup       = search(uplvlsrch,'bnW')
    let containerfunc= substitute(getline(lineup),'[^a-zA-z_]','','g')
    let msg= "no succeeding function calls at this level in ".containerfunc."()"
    echo msg | sleep 2
"    call Dret("s:FlistNext : ".msg)
    return
   endif

  " <s-up>: moving upward in FlistTree one line
  elseif a:dir == 2
"   call Decho(" <s-up>: moving upward in FlistTree one line")
   norm! k

  " <s-down>: moving downward in FlistTree one line
  elseif a:dir == 3
"   call Decho(" <s-down>: moving downward in FlistTree one line")
   norm! j

  " <m-up>: moving upwards to a containing function (ie. higher level)
  "         -or- to the preceding top-level function
  elseif a:dir == 4
"   call Decho(" <m-up>: moving upwards to a containing function (ie. higher level)")
   norm! 0
   if curdepth > 0
    call search(uplvlsrch,'bW')
   else
    call search(samelvlsrch,'bW')
   endif

  " <m-down>: moving downwards to a contained function (ie. lower level)
  elseif a:dir == 5
"   call Decho(" <m-down>: moving downwards to a contained function (ie. lower level)")
   norm! $
   let linedown= search(downlvlsrch,'nW')
   let linestop= search(samelvlsrch,'nW')
   if linestop != 0 && linestop > linedown
    exe linedown
   else
    let linesame = linestop
    let linestop = search(uplvlsrch,'nW')
    if linestop != 0 && linestop > linesame
     exe linesame
    else
     let containerfunc= substitute(getline("."),'[^a-zA-z_]','','g')
     let msg="no further contained function calls in ".containerfunc."()"
     echo msg | sleep 2
"     call Dret("s:FlistNext : ".msg)
     return
    endif
   endif

  endif

  " move cursor onto beginning of function name
  norm! $F(b
  call s:FlistOpen()

" call Dret("s:FlistNext")
 return
endfun

" ---------------------------------------------------------------------
" s:SourceSide: go to the window with source {{{2
"               Issues wincmd l until it goes as far right as possible or
"               it finds a non-readonly window
fun! s:SourceSide()
"  call Dfunc("s:SourceSide()")

  while winnr() != winnr("$")
   wincmd l
   if !&ro
    break
   endif
  endwhile

"  call Dret("s:SourceSide")
endfun

" ---------------------------------------------------------------------
" s:GraphtreeSide: go to the window with a GraphTree {{{2
"                  Searches for a window with b:flisttree existing
fun! s:GraphtreeSide()
"  call Dfunc("s:GraphtreeSide()")
  if !exists("b:flisttree")

   " search windows to the left
"   call Decho("using wincmd h (searching windows to the left)")
   let eikeep= &ei
   set ei=WinEnter,WinLeave,BufEnter,BufLeave,BufWinEnter,BufWinLeave
   while !exists("b:flisttree")
    let curwin= winnr()
    wincmd h
    if curwin == winnr()
     break
    endif
   endwhile
   if exists("b:flisttree")
    let &ei= eikeep
"    call Dret("s:GraphtreeSide")
    return
   endif

   " search all windows
"   call Decho("using windo (searching all windows)")
"   windo call Decho("considering win#".winnr())|if exists("b:flisttree")|let graphside= winnr()|endif
   let &ei= eikeep
   if !exists("graphside")
    errormsg "FlistTree window no longer visible"
"    call Dret("s:GraphtreeSide")
    return
   else
    let b:flisttree= graphside
    exe b:flisttree."wincmd w"
   endif
  endif
"  call Dret("s:GraphtreeSide : b:flisttree#".b:flisttree)
endfun

" ========================================================================
" Modelines: {{{1
" vim:ts=8 fdm=marker
