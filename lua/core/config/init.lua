-- relative numbering for non active lines
vim.wo.relativenumber = true
-- show actual line number for current line instead of zero
vim.wo.number = true

vim.opt.ruler = true
vim.opt.termguicolors = true

vim.o.hidden = true
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.eadirection = "hor"
-- exclude usetab as we do not want to jump to buffers in already open tabs
-- do not use split or vsplit to ensure we don't open any new windows
vim.o.switchbuf = "useopen,uselast"

local function add(value, str, sep)
    sep = sep or ","
    str = str or ""
    value = type(value) == "table" and table.concat(value, sep) or value
    return str ~= "" and table.concat({ value, str }, sep) or value
end
vim.o.fillchars = add({
    "vert:▕", -- alternatives │
    "fold: ",
    "eob: ", -- suppress ~ at EndOfBuffer
    "diff:─", -- alternatives: ⣿ ░
    "msgsep:‾",
    "foldopen:▾",
    "foldsep:│",
    "foldclose:▸",
})
vim.o.diffopt = add({
    "vertical",
    "iwhite",
    "hiddenoff",
    "foldcolumn:0",
    "context:4",
    "algorithm:histogram",
    "indent-heuristic",
}, vim.o.diffopt)

vim.opt.formatoptions = table.concat({
    "1",
    "q", -- continue comments with gq"
    "c", -- Auto-wrap comments using textwidth
    "r", -- Continue comments when pressing Enter
    "n", -- Recognize numbered lists
    "2", -- Use indent from 2nd line of a paragraph
    "t", -- autowrap lines using text width value
    "j", -- remove a comment leader when joining lines.
    -- Only break if the line was not longer than 'textwidth' when the insert
    -- started and only at a white character that has been entered during the
    -- current insert command.
    "lv",
})

vim.o.foldtext = "v:lua.folds()"
vim.o.foldopen = add(vim.o.foldopen, "search")
vim.o.foldlevel = 99
vim.o.foldlevelstart = 10
vim.opt.foldmethod = "syntax"

local executable = function(e)
    return vim.fn.executable(e) > 0
end

-- Use faster grep alternatives if possible
if executable("rg") then
    vim.o.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
    vim.o.grepformat = add("%f:%l:%c:%m", vim.o.grepformat)
elseif executable("ag") then
    vim.o.grepprg = [[ag --nogroup --nocolor --vimgrep]]
    vim.o.grepformat = add("%f:%l:%c:%m", vim.o.grepformat)
end

-- vim.o.wildcharm = api.nvim_eval([[char2nr("\<C-Z>")]]) -- FIXME: what's the correct way to do this?
vim.o.wildmenu = true
vim.o.wildmode = "full" -- Shows a menu bar as opposed to an enormous list
vim.o.wildignorecase = true -- Ignore case when completing file names and directories
-- Binary
vim.o.wildignore = add({
    "*.aux,*.out,*.toc",
    "*.o,*.obj,*.dll,*.jar,*.pyc,*.rbc,*.class",
    "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
    "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
    "*.eot,*.otf,*.ttf,*.woff",
    "*.doc,*.pdf",
    "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
    -- Cache
    ".sass-cache",
    "*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem",
    -- Temp/System
    "*.*~,*~ ",
    "*.swp,.lock,.DS_Store,._*,tags.lock",
})
vim.o.wildoptions = "pum"
vim.o.pumblend = 3 -- Make popup window translucent

vim.opt.conceallevel = 2
vim.opt.breakindentopt = "sbr"
vim.opt.linebreak = true -- lines wrap at words rather than random characters
vim.opt.synmaxcol = 1024 -- don't syntax highlight long lines
vim.opt.signcolumn = "yes:2"
vim.opt.colorcolumn = "+1" -- Set the colour column to highlight one column after the 'textwidth'
vim.o.cmdheight = 2 -- Set command line height to two lines
vim.o.showbreak = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
vim.g.vimsyn_embed = "lPr" -- allow embedded syntax highlighting for lua,python and ruby

vim.o.list = true -- invisible chars
vim.o.listchars = add({
    "eol: ",
    "tab:│ ",
    "extends:›", -- Alternatives: … »
    "precedes:‹", -- Alternatives: … «
    "trail:•", -- BULLET (U+2022, UTF-8: E2 80 A2)
})

vim.o.emoji = false

local TAB_WIDTH = 4

vim.opt.wrap = true

vim.opt.shiftwidth = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.tabstop = TAB_WIDTH
vim.opt.expandtab = true

vim.opt.textwidth = 100
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.o.shiftround = true

vim.o.joinspaces = false
vim.o.gdefault = true
vim.o.pumheight = 15
vim.o.confirm = true -- make vim prompt me to save before doing destructive things
vim.o.completeopt = add({ "menuone", "noinsert", "noselect" })
vim.o.hlsearch = true
vim.o.autowriteall = true -- automatically :write before running commands and changing files
vim.o.clipboard = "unnamedplus"
vim.o.lazyredraw = true
vim.o.laststatus = 2
vim.o.showtabline = 2
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.belloff = "all"
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.showmode = false
vim.o.showcmd = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.visualbell = true
vim.o.errorbells = false

vim.o.titlestring = " ❐ %t %r %m"
vim.o.titleold = '%{fnamemodify(getcwd(), ":t")}'
vim.o.title = true
vim.o.titlelen = 70

vim.o.mouse = "a"
vim.o.mousefocus = true
