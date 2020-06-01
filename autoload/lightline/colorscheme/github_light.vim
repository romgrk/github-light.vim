"     color       #rrggbb   256
let s:blue   = [ '#2076d8', 27 ]
let s:green  = [ '#1cad3c', 28 ]
let s:purple = [ '#6f42c1', 57 ]
let s:red1   = [ '#db524e', 196 ]
let s:red2   = [ '#c03545', 169 ]
let s:yellow = [ '#eab700', 214 ]
let s:fg    =  [ '#24292e', 238 ]
let s:bg    =  [ '#ffffff', 255 ]
let s:gray1 =  [ '#454b53', 238 ]
let s:gray2 =  [ '#f0f0f0', 255 ]
let s:gray3 =  [ '#c0c0c0', 250 ]
let s:green =  [ '#1cad3c', 34 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.inactive.right  = [ [ s:bg, s:gray3 ] ]

let s:p.normal.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray2 ] ]
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.error   = [ [ s:red2, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.left    = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.left   = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.left    = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:gray1, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = [ [ s:bg, s:red2, 'bold' ], [ s:fg, s:gray3 ] ]

let g:lightline#colorscheme#github_light#palette = lightline#colorscheme#flatten(s:p)
