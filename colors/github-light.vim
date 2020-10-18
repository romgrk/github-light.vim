" !::exe [So | call colorizer#ColorHighlight(1)]

if &bg != 'light'
  set background=light
end

let colors_name = 'github-light'

" Highlighting function
function! s:_ (name, ...)
  let fg = ''
  let bg = ''
  let attr = ''

  if type(a:1) == 3
    let fg   = get(a:1, 0, '')
    let bg   = get(a:1, 1, '')
    let attr = get(a:1, 2, '')
  else
    let fg   = get(a:000, 0, '')
    let bg   = get(a:000, 1, '')
    let attr = get(a:000, 2, '')
  end

  let cmd = 'hi! ' . a:name
  if !empty(fg)
    let cmd .= ' guifg=' . fg
  end
  if !empty(bg)
    let cmd .= ' guibg=' . bg
  end
  if !empty(attr)
    let cmd .= ' gui=' . attr
  end
  execute cmd
endfunc

" Colors                                                                     {{{

let s:black0    = '#000000'
let s:black1    = '#24292e'
let s:black2    = '#4c4c4c'
let s:white     = '#f4fbfe'

let s:darkyellow      = '#c59000'
let s:yellow          = '#eab700'
let s:brightyellow    = '#ffe914'

let s:gh_link = '#0366d6'

let s:gh_grey   = '#8f9aa9'
let s:gh_red    = '#DB524E'
let s:gh_orange = '#e98642'
let s:gh_blue0  = '#0d33a5'
let s:gh_blue1  = '#2076d8'
let s:gh_purple = '#6f42c1'
" let s:gh_url    = '#80a0ff'
let s:gh_url    = '#678CFA'

let s:gh_search      = '#FFEEB9'
let s:gh_search_dark = '#EDB34D'

let s:gh_info_fg  = '#3c71be'
let s:gh_info_bg0 = '#D8EEFD'
let s:gh_info_bg1 = '#E6F3FE'

let s:gh_add_fg  = '#1cad3c'
let s:gh_add_bg0 = '#acf2bd'
let s:gh_add_bg1 = '#cdffd8'
let s:gh_add_bg2 = '#e6ffed'

let s:gh_danger_fg  = '#c03545'
let s:gh_danger_bg0 = '#ffdce0'
let s:gh_danger_bg1 = '#ffeef0'


" }}}
" Theme                                                                      {{{

let theme = {}
let theme.base                  = '#202020'
let theme.insensitive_base      = '#282828'

let theme.fg                    = '#24292e'
let theme.fg_light              = '#454B53'
let theme.fg_lighter            = '#666D74'
let theme.fg_subtle             = '#c0c0c0'
let theme.fg_dark               = '#24292e'
let theme.fg_widget             = '#cad0d3'
let theme.fg_conceal            = '#e2e8eb'
let theme.fg_overlay            = '#f0f0f0'
let theme.fg_widget_dark        = '#8f9aa9'
let theme.fg_widget_alt         = '#ffffff'
let theme.fg_widget_alt_nc      = '#333333'


let theme.bg                    = '#ffffff'
let theme.bg_subtle             = '#f0f0f0'
let theme.bg_popover            = '#e0e0e0'
let theme.bg_verysubtle         = '#f5f5f5'
let theme.bg_widget             = '#ffffff'
let theme.bg_overlay            = '#121212'
let theme.bg_dark               = '#d0d0d0'
let theme.bg_light              = '#e5e7e9'
let theme.bg_widget_alt         = '#4c4c4c'
let theme.bg_widget_alt_nc      = '#aaaaaa'

let theme.fg_hl                 = '#a3a3a3'
let theme.bg_hl                 = '#404040'

let theme.hover                 = '#505050'

let theme.hl                    = '#599eff'
let theme.hl_fg                 = '#ffffff'

let theme.fg_selection          = 'none'
let theme.bg_selection          = '#d7d4ef'
let theme.bg_selection_dark     = '#d7d4ef'
let theme.bg_selection_light    = '#deebfe'
let theme.bg_selection_very_light = '#e9f2ff'

"let theme.insensitive          = '#515a5a'
let theme.unfocused_fg          = '#949796'
let theme.unfocused_text        = '#eeeeec'
let theme.unfocused_bg          = '#393f3f'
let theme.unfocused_base        = '#2c2c2c'

let theme.border                = '#1c1f1f'
let theme.unfocused_border      = '#1f2222'

let theme.folded_bg             = '#252525'
let theme.folded_fg             = '#999999'

" }}}
" General UI                                                                 {{{

let s:text_colors = {
\ 'Normal':  theme.fg,
\ 'Info':    '#599eff',
\ 'Success': '#5faf00',
\ 'Warning': '#ff8700',
\ 'Debug':   '#f0c904',
\ 'Error':   '#ef2021',
\ 'Special': '#9c5fff',
\}
for key in keys(s:text_colors)
  call s:_('Text' . key, s:text_colors[key], '', '')
  call s:_('Bold' . key, s:text_colors[key], '', 'bold')
endfor

call s:_('Normal',           theme.fg,        theme.bg)
call s:_('EndOfBuffer',      theme.fg_widget, theme.bg)
call s:_('NormalPopup',      theme.fg,        theme.bg_subtle)
call s:_('NormalPopover',    theme.fg,        theme.bg_popover)

call s:_('Cursor',           '', theme.base,  'reverse')
call s:_('SecondaryCursor',  '', theme.bg_hl, 'none')

call s:_('CursorLine',       '',              theme.bg_verysubtle)
call s:_('CursorColumn',     '',              theme.bg_verysubtle)
call s:_('CursorLineNr',     theme.hl,        theme.bg_verysubtle, 'none')
call s:_('LineNr',           theme.fg_widget, theme.bg_widget, 'none')

call s:_('TermCursor',       theme.bg,        'none',            'reverse')
call s:_('TermCursorNC',     theme.fg_hl,     'none',            'reverse')
call s:_('TermNormal',       theme.bg,        theme.base,    '')
hi! link TermNormalNC TermNormal


call s:_('Visual',         '', theme.bg_selection)
call s:_('VisualBold',     '', theme.bg_selection, 'bold')
call s:_('LastVisual',     '',                  theme.bg_selection_dark, '')
call s:_('WildMenu',       theme.fg,            theme.bg_selection)
call s:_('StatusLine',     theme.fg_light,      theme.bg_dark,          'none')
call s:_('StatusLineNC',   theme.fg_lighter,    theme.bg_dark,          'none')
call s:_('StatusLinePart', theme.fg_widget_alt, theme.bg_widget_alt,     'bold')
call s:_('StatusLinePartNC', theme.fg_widget_alt_nc, theme.bg_widget_alt_nc,     'bold')
call s:_('Separator',      '#4c4c4c',           'none',                  '')
call s:_('VertSplit',      theme.fg_subtle,     theme.bg_widget,         'none')

call s:_('Pmenu',            theme.fg_overlay, theme.bg_overlay)
call s:_('PmenuSel',         theme.hl_fg,      theme.hl)
call s:_('PmenuSelBold',     theme.hl_fg,      theme.hl, 'bold')
call s:_('PmenuSbar',        '',       theme.bg_dark)
call s:_('PmenuThumb',       '#666660', '#666660')

if exists('&pumblend')
  set pumblend=20
end

call s:_('Terminal',         s:white,  s:black0, '')


call s:_('Folded',           'none',          theme.bg_verysubtle,  'none')
call s:_('FoldColumn',       theme.fg_subtle, theme.bg_widget,      '')
call s:_('SignColumn',       '',              theme.bg_widget, '')
call s:_('ColorColumn',      '',              theme.bg_widget, '')


call s:_('IndentGuidesEven', theme.fg_widget, '', '')
call s:_('IndentGuidesOdd',  theme.fg_widget, '', '')

call s:_('TabLine',          s:white,       s:black1, 'bold')
call s:_('TabLineSel',       s:gh_link,     s:black1, 'bold')
call s:_('TabLineFill',      'none',        s:black1, 'bold')

let s:bg_current = theme.bg
let s:bg_visible = theme.bg_subtle
let s:bg_other   = s:black1

let s:bg_accent = '#f1e05a'

call s:_('BufferCurrent',     s:gh_link,        s:bg_current, 'bold')
call s:_('BufferVisible',     s:gh_grey,        s:bg_visible, 'bold')
call s:_('Buffer',            s:white,          s:bg_other, 'bold')
call s:_('BufferCurrentMod',  s:yellow,         s:bg_current, 'bold')
call s:_('BufferVisibleMod',  s:darkyellow,     s:bg_visible, 'bold')
call s:_('BufferMod',         s:darkyellow,     s:bg_other, 'bold')
call s:_('BufferSignCurrent', theme.fg_widget_dark, s:bg_current, 'none')
call s:_('BufferSignVisible', theme.fg_widget_dark, s:bg_visible, 'none')
call s:_('BufferSign',        theme.fg_widget_dark, s:bg_other, 'none')
call s:_('BufferPart',        s:gh_info_fg,     s:gh_info_bg0, 'bold')

" }}}
" Search, Highlight, Conceal, Messages                                               {{{

call s:_('Search',          '', s:gh_search,      'none')
call s:_('IncSearch',       '', s:gh_search_dark, 'none')
call s:_('IncSearchCursor', '',     '',               'reverse')

call s:_('Conceal',         theme.fg_conceal, 'none',    '')
call s:_('SpecialKey',      '#333333',        'none',    '')
call s:_('NonText',         theme.fg_subtle,  '',        'bold')
call s:_('MatchParen',      '',               '#BCE3FF', 'none')
call s:_('SpecialOpt',      '#868680',        '#32363a', '')
call s:_('Whitespace',      '#8f9aa9',        '',        '')



call s:_('AutoHL',          '',     theme.bg,  'none')
call s:_('Highlight',       'none', theme.bg_selection_light,       'none')
call s:_('HighlightSubtle', 'none', theme.bg_selection_very_light, 'none')

call s:_('Key',             '#799d6a', '', '')
call s:_('Question',        '#65C254', '', '',     'Green', '')
call s:_('Todo',            '#3b84ea', 'none', 'bold')

call s:_('File',            theme.fg,  '',     'bold')
call s:_('Directory',       '#3365CE', '',     'bold')
call s:_('Section',         '#3365CE', '',     'bold')
call s:_('Title',           '#3365CE', '',     'bold')
" call s:_('Directory',       '#3365CE', '',     'bold')

call s:_('Bold', '', '', 'bold')

hi! link Msg        TextSuccess
hi! link MoreMsg    TextInfo
hi! link WarningMsg TextWarning
hi! link ErrorMsg   TextError
hi! link Error      TextError
hi! link ModeMsg    TextSpecial


" }}}
" Main Syntax                                                               {{{1

call s:_('Tag',                  s:gh_url, '',        'underline')
call s:_('Link',                 s:gh_url, '',        'underline')
call s:_('URL',                  s:gh_url, '',        'underline')

call s:_('Comment',              s:gh_grey, '',        '')
call s:_('CommentBold',          s:gh_grey, '',        'bold')
call s:_('SpecialComment',       '#7597c6', '',        'bold')
hi! link CommentLabel   CommentBold
hi! link CommentSection CommentBold
hi! link Noise Comment

call s:_('Global',               s:gh_blue1, '',        'none')
call s:_('PreProc',              s:gh_blue1, '',        'none')
call s:_('Macro',                s:gh_blue1, '',        'bold')
call s:_('Define',               s:gh_blue1, '',        'bold')
call s:_('PreCondit',            s:gh_blue1, '',        'bold')
call s:_('Include',              s:gh_blue1, '',        'bold')

call s:_('Repeat',               s:gh_red, '',        '')
call s:_('Keyword',              s:gh_red, '',        '')
call s:_('Statement',            s:gh_red, '',        'none')
call s:_('Label',                s:gh_red, '',        '')

call s:_('Operator',             s:gh_blue1, '',        '')
"call s:_('Operator',             '#94afff', '',        '')

call s:_('Constant',             s:gh_blue1, '',        'none')
call s:_('Number',               s:gh_blue1, '',        'none')
call s:_('Float',                s:gh_blue1, '',        'none')
call s:_('Boolean',              s:gh_blue1, '',        'none')
call s:_('Enum',                 s:gh_blue1, '',        'none')

call s:_('Delimiter',            '#668799', '',        'none')
call s:_('DelimiterAlt',         '#799033', '',        'none')
call s:_('SpecialChar',          '#799d6a', '',        'bold')

call s:_('String',               s:gh_blue0, '',        'none')
call s:_('StringDelimiter',      '#032f62', '',        'bold')

call s:_('Character',            '#238fff', '',        'bold')


call s:_('SpecialIdentifier',    '#9c5fff', '',        'none')

call s:_('Special',              '#a755df', '',        'none')
call s:_('SpecialBold',          '#a755df', '',        'bold')
call s:_('SpecialDelimiter',     '#a040af', '',        'none')


call s:_('Identifier',           theme.fg,  '',        'none')
call s:_('Variable',             '#ffe790', '',        'none')
call s:_('Argument',             theme.fg,  '',        'none')

call s:_('Function',             s:gh_purple, '',        'none')
call s:_('Method',               s:gh_purple, '',        'bold')

call s:_('Symbol',               s:gh_blue1, '',        'none')
call s:_('Control',              s:gh_blue1, '',        'none')
call s:_('PredefinedIdentifier', s:gh_blue1, '',        'none')
call s:_('Predefined',           s:gh_blue1, '',        'none')

call s:_('StaticFunc',           '#ffb964', '',        'none')
call s:_('Property',             s:gh_orange, '',        'none')


call s:_('Type',                 s:gh_red, '',        'none')
call s:_('StorageClass',         s:gh_red, '',        'none')
call s:_('Class',                s:gh_red, '',        'none')
call s:_('Structure',            s:gh_red, '',        'none')
call s:_('Typedef',              s:gh_red, '',        'none')

call s:_('Regexp',               '#dd0093', 'none',        'none')
call s:_('RegexpSpecial',        '#a40073', 'none',        'none')
call s:_('RegexpDelimiter',      '#540063', 'none',        'bold')
call s:_('RegexpKey',            '#5f0041', 'none',        'bold')

" }}}
" Diff                                                                       {{{

call s:_('diffLine',    s:gh_grey, s:gh_info_bg1, 'none')
call s:_('diffSubName', s:gh_grey, s:gh_info_bg1, 'none')

hi! clear DiffAdd
hi! clear DiffChange
hi! clear DiffText
hi! clear DiffDelete

call s:_('DiffAdd',      '',             s:gh_add_bg2)
call s:_('DiffChange',   '',             s:gh_add_bg2)
call s:_('DiffText',     '',             s:gh_add_bg0)
call s:_('DiffDelete',   '',             s:gh_danger_bg1)

call s:_('DiffAdded',    theme.fg_light, s:gh_add_bg1)
call s:_('DiffModified', theme.fg_light, s:gh_info_bg0)
call s:_('DiffRemoved',  theme.fg_light, s:gh_danger_bg0)

call s:_('DiffAddedGutter',    s:gh_add_fg, s:gh_add_bg1)
call s:_('DiffModifiedGutter', s:gh_info_fg, s:gh_info_bg0)
call s:_('DiffRemovedGutter',  s:gh_danger_fg, s:gh_danger_bg0)

"                                                                            }}}
" Additionnal/Common groups                                         {{{1

call s:_('DbgCurrent',           '#DEEBFE', '#345FA8', '')
call s:_('DbgBreakPt',           '',        '#4F0037', '')

" Jumping around {{{

call s:_('PreciseJumpTarget',       '#B9ED67', '#405026', '' )
call s:_('EasyMotionTargetDefault', '#ff0000', '', 'bold')
hi!  link Sneak                  EasyMotionTargetDefault
hi!  link SneakPluginTarget      EasyMotionTargetDefault
hi!  link SneakStreakTarget      EasyMotionTargetDefault
hi!  link SneakStreakMask        EasyMotionShadeDefault

" }}}

" Languages/Others                                                    {{{1

" Help                                                                      {{{2

hi! link helpURL           URL
hi! link helpHyperTextJump Purple

" PHP                                                                       {{{2

hi! link phpFunctions Function
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python                                                                    {{{2

hi! link pythonOperator Operator

" Ruby                                                                      {{{2

hi! link rubyRegexpDelimiter       RegexpDelimiter
hi! link rubyRegexp                Regexp
hi! link rubyRegexpSpecial         RegexpSpecial
hi! link rubyPredefinedIdentifier  PredefinedIdentifier

hi! link rubyClass              Class
hi! link rubyIdentifier         Identifier
hi! link rubyInstanceVariable   InstanceVariable
hi! link rubySymbol             Symbol
hi! link rubyControl            Control

hi! link rubySharpBang Comment
hi! link rubyConstant  Type
hi! link rubyFunction  Function

hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule         rubyClass

hi! link rubyString                 String
hi! link rubyStringDelimiter        StringDelimiter
hi! link rubyInterpolationDelimiter Identifier


" Erlang                                                                    {{{2

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" CoffeeScript                                                              {{{2

hi! link coffeeRegExp rubyRegexp

" Lua & Moonscript'                                                         {{{2

hi! link luaOperator Conditional

hi! link moonObject     Type
hi! link moonSpecialOp  StringDelimiter
hi! link moonSpecialVar Identifier
hi! link moonObjAssign  StorageClass
hi! link moonObjAssign  StorageClass
hi! link moonConstant   Global

" Objective-C/Cocoa                                                         {{{2

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" 1}}}

" 1}}}
