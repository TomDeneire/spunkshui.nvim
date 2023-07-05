local bg          = "#2a2a2a"
local white       = "#d4d4d4"
local blue        = '#569cd6'
local brightblue  = '#7bbad8'
local red         = '#f44747'
local orange      = '#ed872d'
local yellow      = '#fac863'
local green       = '#99c794'
local cyan        = '#62b3b2'
local purple      = '#c594c5'
local brown       = '#ce9178'
local brightwhite = '#ffffff'
local grey        = '#a7adba'
local selection   = '#C34043'
local line_hl     = '#393836'

local lush        = require("lush")
local hsl         = lush.hsl
local hsluv       = lush.hsluv

local theme       = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal         { }, -- Normal text
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Editor (see h: highlight-groups)
    CursorLineNR { fg = white, bold = false },
    CursorLineNr { fg = white, bold = false },
    IncSearch { fg = white, bg = selection },
    MatchParen { fg = orange },
    Search { fg = white, bg = selection },
    NormalFloat { fg = white, bg = line_hl }, -- e.g. whichkey
    FloatBorder { bg = "none" },
    FloatTitle { bg = "none" },
    NormalDark { fg = white, bg = cyan },
    LazyNormal { bg = line_hl, fg = white },
    MasonNormal { bg = line_hl, fg = white },
    TelescopeTitle { fg = white },
    TelescopePromptNormal { bg = bg },
    TelescopePromptBorder { fg = white, bg = bg },
    TelescopeResultsNormal { fg = white, bg = bg },
    TelescopeResultsBorder { fg = white, bg = bg },
    TelescopePreviewNormal { bg = bg },
    TelescopePreviewBorder { bg = bg, fg = white },
    -- Pmenu  { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
    PmenuSel { fg = "NONE", bg = selection },
    -- PmenuSbar  { bg = theme.ui.bg_m1 },
    -- PmenuThumb  { bg = theme.ui.bg_p2 },
    TelescopeResultsBorder { fg = white, bg = bg },
    -- Syntax
    Annotation { fg = white },
    Attribute { fg = white },
    Boolean { fg = cyan },
    Character { fg = red, bold = false },
    -- sym "@character.special" { fg = red, bold = false },
    -- Comment { fg = green, italic = false },
    -- sym "@conditional" { fg = purple },
    -- sym "@conditional.ternary" { fg = purple },
    -- Constant { fg = brightblue },
    -- sym "@constant.builtin" { fg = brightblue },
    -- sym "@constant.macro" { fg = brightblue },
    -- sym "@constructor" { fg = yellow, bold = false },
    -- sym "@constructor.lua" { fg = yellow, bold = false },
    -- Define { fg = purple },
    -- Delimiter { fg = yellow },
    -- sym "@error" { fg = red, bold = true },
    -- sym "@field" { fg = grey, bold = false },
    -- Float { fg = green },
    -- Function { fg = yellow },
    -- sym "@function.call" { fg = yellow },
    -- sym "@function.builtin" { fg = cyan },
    -- sym "@function.macro" { fg = yellow },
    -- Fun { fg = yellow },
    -- Identifier { fg = white },
    -- Include { fg = purple },
    -- Keyword { fg = blue },
    -- sym "@keyword.function" { fg = blue },
    -- sym "@keyword.operator" { fg = blue, bold = false },
    -- sym "@keyword.return" { fg = purple, bold = true },
    -- sym "@keyword.luap" { fg = red },
    -- Label { fg = yellow },
    -- Normal { fg = white },
    -- Number { fg = green },
    -- Method { fg = red, bold = false },
    -- sym "@method.call" { fg = yellow },
    -- sym "@namespace" { fg = white, bold = false },
    -- Operator { fg = yellow },
    -- sym "@parameter" { fg = grey },
    -- sym "@parameter.reference" { fg = grey },
    -- sym "@property" { fg = grey },
    -- PreProc { fg = yellow },
    -- Punctuation { fg = yellow },
    -- sym "@punctuation.delimiter" { fg = yellow },
    -- sym "@punctuation.bracket" { fg = yellow },
    -- sym "@punctuation.special" { fg = yellow },
    -- Repeat { fg = purple },
    -- Regex { fg = red, bold = false },
    -- Special { fg = cyan },
    -- Special1 { fg = cyan },
    -- Special2 { fg = cyan },
    -- Special3 { fg = cyan },
    -- SpecialChar { fg = orange },
    -- Statement { fg = red, bold = false },
    -- StorageClass { fg = yellow },
    -- String { fg = brown },
    -- sym "@string.regex" { fg = red, bold = false },
    -- sym "@string.escape" { fg = red, bold = false },
    -- sym "@string.special" { fg = red, bold = false },
    -- Structure { fg = green, bold = true },
    -- sym "@symbol" { fg = cyan, bold = false },
    -- sym "@tag" { fg = red },
    -- sym "@tag.attribute" { fg = yellow },
    -- sym "@tag.delimiter" { fg = yellow },
    -- Term { fg = white },
    -- Text { fg = white },
    -- sym "@text.strong" { fg = white, bold = true },
    -- sym "@text.emphasis" { fg = white, bold = true },
    -- sym "@text.underline" { fg = white, underline = true },
    -- -- sym"@text.strike" = "TSStrike",
    -- sym "@text.title" { fg = white },
    -- sym "@text.literal" { fg = brightblue },
    -- sym "@text.uri" { fg = red },
    -- sym "@text.math" { fg = red },
    -- sym "@text.reference" { fg = white },
    -- sym "@text.environment" { fg = white },
    -- sym "@text.environment.name" { fg = orange },
    -- sym "@text.note" { fg = white },
    -- sym "@text.warning" { fg = orange },
    -- sym "@text.danger" { fg = red, bold = false },
    -- Todo { fg = yellow },
    -- Type { fg = green, bold = true },
    -- sym "@type.builtin" { fg = green, bold = true },
    -- sym "@type.qualifier" { fg = green, bold = true },
    -- sym "@type.definition" { fg = green, bold = true },
    -- Variable { fg = white },
    -- sym "@variable.builtin" { fg = cyan },
    -- -- QtechNG files types
    -- MumpsCommand { fg = white, italic = true },
    -- MumpsLabel { fg = blue, bold = true },
    -- MumpsGlobalName { fg = blue },
    -- MumpsMacro { fg = blue, italic = true },
    -- MumpsPName { fg = brightblue, italic = true },
    -- MumpsUName { fg = cyan, bold = true },
    -- MumpsCName { fg = grey },
    -- MumpsFName { fg = brightblue, bold = true },
    -- MumpsDoGoLabel { fg = cyan, italic = true },
    -- MumpsLabelName { fg = green, bold = true },
    -- MumpsIntrinsicFunction { fg = cyan, italic = true },
    -- BfileValue { fg = brightwhite },
    -- DfileInstruction { fg = brightwhite, bold = true },
    -- DfileMacroLabel { fg = blue, bold = true },
    -- DfileSynopsis { fg = purple },
    -- DfileExample { fg = yellow },

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    -- Constant       { }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    -- Statement      { }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
  }
end)

return theme
