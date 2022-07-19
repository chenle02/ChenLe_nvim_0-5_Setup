-- Setpup Telescope
-- Le Chen, following
-- https://github.com/whatsthatsmell/dots/tree/master/public%20dots/vim-nvim/lua/joel/telescope
--{{{ Define variables and functions:
local key_map = vim.api.nvim_set_keymap
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"
local custom_actions = {}
function custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if num_selections > 1 then
    local cwd = picker.cwd
    if cwd == nil then
      cwd = ""
    else
      cwd = string.format("%s/", cwd)
    end
    vim.cmd "bw!"
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s%s", open_cmd, cwd, entry.value))
    end
    vim.cmd "stopinsert"
  else
    if open_cmd == "vsplit" then
      actions.file_vsplit(prompt_bufnr)
    elseif open_cmd == "split" then
      actions.file_split(prompt_bufnr)
    elseif open_cmd == "tabe" then
      actions.file_tab(prompt_bufnr)
    else
      actions.select_default(prompt_bufnr)
    end
  end
end
function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function custom_actions.multi_selection_open_split(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "split")
end
function custom_actions.multi_selection_open_tab(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "tabe")
end
function custom_actions.multi_selection_open(prompt_bufnr)
  custom_actions._multiopen(prompt_bufnr, "edit")
end
--}}}
--{{{ Load extensions:
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('coc')
require("telescope").load_extension("gh")
require("telescope").load_extension("repo")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("bookmarks")
-- require('telescope').load_extension('neoclip')
require('telescope').load_extension('media_files')
require('telescope').load_extension('zoxide')
require("telescope").load_extension("frecency")
require('telescope').load_extension('vw')
require('telescope').load_extension('buffer_lines')
-- require('telescope').load_extension('ultisnips')
-- require('telescope').extensions.notify.notify(<opts>)
--}}}
--{{{ Setup for telescope:
require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- layout_config = {
    --   vertical = { width = 0.9 }
    --   -- other layout configuration here
    -- },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      },
    },
  vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim", -- add this value
    },
  pickers = {
    find_files = {
      theme = "dropdown", -- Choose from {"dropdown", "cursor", "ivy"}
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent cd %s", dir))
          end
        }
      }
    },
  },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      -- filetypes = {"png", "webp", "jpg", "jpeg","pdf","djvu"},
      filetypes = {"png", "webp", "jpg", "jpeg","pdf", "djvu"},
      -- find_cmd = "rg" -- find command (defaults to `fd`)
    },
    frecency = {
      db_root = "/home/lechen/.local/share/nvim/",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/lechen/.config",
        ["data"]    = "/home/lechen/.local/share",
        ["project"] = "/home/lechen/Dropbox/workspace/svn/",
        ["wiki"]    = "/home/lechen/Dropbox/vimwiki"
      }
    },
  },
}
--}}}
-- Key bindings
--{{{ ;g, //, \[: my old mappings in vim
vim.cmd([[
" nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;g <cmd>lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'}}<cr>
nnoremap <silent> // <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <leader>[ <cmd>Telescope buffers<cr>
]])
--}}}
-- TELESCOPE keymaps  --
--{{{ registers: <space>rr
key_map("n", "<space>rr", [[<Cmd>lua require'telescope.builtin'.registers()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ neoclip: <space>r, clipboard, using default register plus
key_map("n", "<space>r", [[<Cmd>lua require('telescope').extensions.neoclip.plus()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ find_files with names that contain cursor word: ,f
-- find files with names that contain cursor word
key_map(
  "n",
  ",f",
  [[<Cmd>lua require'telescope.builtin'.find_files({find_command={'fd', vim.fn.expand('<cword>')}})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ commands: ;c
-- open available commands & run it
key_map(
  "n",
  ";c",
  [[<Cmd>lua require'telescope.builtin'.commands({results_title='Commands Results'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ oldfiles: ;o
-- Telescope oldfiles
key_map(
  "n",
  ";o",
  [[<Cmd>lua require'telescope.builtin'.oldfiles({results_title='Recent-ish Files'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ fzf lines: ;l
-- Telescopic version of FZF's :Lines
key_map(
  "n",
  ";l",
  [[<Cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ live_grep: ;r
key_map(
  "n",
  ";r",
  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ key_maps: ;k
key_map(
  "n",
  ";k",
  [[<Cmd>lua require'telescope.builtin'.keymaps({results_title='Key Maps Results'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ buffers: ;b, or use \[ as above
key_map(
  "n",
  ";b",
  [[<Cmd>lua require'telescope.builtin'.buffers({prompt_title = '', results_title='﬘', winblend = 2, layout_strategy = 'vertical', layout_config = { width = 0.40, height = 0.55 }})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ help_tags: ;;
key_map(
  "n",
  ";;",
  [[<Cmd>lua require'telescope.builtin'.help_tags({results_title='Help Results'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ marks: ;m
key_map(
  "n",
  ";m",
  [[<Cmd>lua require'telescope.builtin'.marks({results_title='Marks Results'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ bookmarks: not working
-- -- search Brave bookmarks & go
-- key_map(
--   "n",
--   "<space>b",
--   [[<Cmd>lua require('telescope').extensions.bookmarks.bookmarks()<CR>]],
--   { noremap = true, silent = true }
-- )}}}
--{{{ zoxide: \z
-- -- open zoxide list
key_map(
  "n",
  "<leader>z",
  ":lua require'telescope'.extensions.zoxide.list{results_title='Z Directories', prompt_title='Z Prompt'}<CR>",
  { noremap = true, silent = true }
)
--}}}
--{{{ frequency: ``
-- -- open frequency list
key_map(
  "n",
  "``",
  "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  {noremap = true, silent = true}
)
--}}}
--{{{ media_files: <space>m to copy, <space>mm open in zathura
-- -- open frequency list
key_map(
  "n",
  "<space>m",
  "<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>",
  {noremap = true, silent = true}
)
-- key_map(
--   "n",
--   "<space>mm",
--   "<Cmd>!zathura <Ctrl-r>+<CR>",
--   {noremap = true, silent = true}
-- )
vim.cmd([[
  nnoremap <silent> <space>mm :!zathura "+\" &<CR>
]])
--}}}
--{{{ telescope notify history: \nh
key_map(
  "n",
  "<leader>nh",
  [[<Cmd>lua require('telescope').extensions.notify.notify({results_title='Notification History', prompt_title='Search Messages'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
-- show LSP implementations{{{
key_map(
  "n",
  "<leader>ti",
  [[<Cmd>lua require'telescope.builtin'.lsp_implementations()<CR>]],
  { noremap = true, silent = true }
)

-- show LSP definitions
key_map(
  "n",
  "<leader>td",
  [[<Cmd>lua require'telescope.builtin'.lsp_definitions({layout_config = { preview_width = 0.50, width = 0.92 }, path_display = { "shorten" }, results_title='Definitions'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ Turn off word suggestions in telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/94
vim.g.completion_chain_complete_list = {
	default = {
		{ complete_items = { "lsp", "path", "buffers", "snippet" } },
		{ mode = "<c-p>" },
		{ mode = "<c-n>" },
	},
	TelescopePrompt = {},
	frecency = {},
}
-- https://github.com/nvim-telescope/telescope.nvim/issues/161
-- vim.cmd([[
--   autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
-- ]])
--}}}
-- Customize the telescope
local M = {}
--{{{ begin github related functions
--{{{ repo_list: \rl, list repos
-- requires repo extension
function M.repo_list()
  local opts = {}
  opts.prompt_title = " Repos"
  require("telescope").extensions.repo.list(opts)
end
key_map("n", "<leader>rl", [[<Cmd>lua require'le.telescope'.repo_list()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ gh_issues: \is
-- requires GitHub extension
function M.gh_issues()
  local opts = {}
  opts.prompt_title = " Issues"
  require("telescope").extensions.gh.issues(opts)
end
key_map("n", "<leader>is", [[<Cmd>lua require'le.telescope'.gh_issues()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ gh_prs: \pr
function M.gh_prs()
  local opts = {}
  opts.prompt_title = " Pull Requests"
  require("telescope").extensions.gh.pull_request(opts)
end
key_map("n", "<leader>pr", [[<Cmd>lua require'le.telescope'.gh_prs()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ git_branches: \gc
key_map(
  "n",
  "<leader>gc",
  [[<Cmd>lua require'telescope.builtin'.git_branches()<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ git_comments: \gl, logs
key_map("n", "gl", [[<Cmd>lua require'telescope.builtin'.git_commits()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ git_status: \gs
-- git_status - <tab> to toggle staging
key_map("n", "gs", [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]], { noremap = true, silent = true })
--}}}
-- end github related functions }}}
--{{{ grep_filtered:
-- grep_string pre-filtered from grep_prompt
local function grep_filtered(opts)
  opts = opts or {}
  require("telescope.builtin").grep_string {
    path_display = { "smart" },
    search = opts.filter_word or "",
  }
end
--}}}
--{{{ grep word under cursor: \g, \G
key_map("n", "<leader>g", [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]], { noremap = true, silent = true })
-- grep word under cursor - case-sensitive (exact word) - made for use with Replace All - see <leader>ra
key_map(
  "n",
  "<leader>G",
  [[<Cmd>lua require'telescope.builtin'.grep_string({word_match='-w'})<CR>]],
  { noremap = true, silent = true }
)
--}}}
--{{{ grep_prompt: <space>g, grep_filtered
-- open vim.ui.input dressing prompt for initial filter
function M.grep_prompt()
  vim.ui.input({ prompt = "Rg " }, function(input)
    grep_filtered { filter_word = input }
  end)
end
key_map("n", "<space>g", [[<Cmd>lua require'le.telescope'.grep_prompt()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ project_files: ;p
M.project_files = function()
  local _, ret, stderr = utils.get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  local gopts = {}
  local fopts = {}

  gopts.prompt_title = " Find"
  gopts.prompt_prefix = "  "
  gopts.results_title = " Repo Files"

  fopts.hidden = true
  fopts.file_ignore_patterns = {
    ".vim/",
    ".local/",
    ".cache/",
    "Downloads/",
    ".git/",
    "Library/.*",
    ".rustup/.*",
    "Movies/",
    ".cargo/registry/",
  }

  if ret == 0 then
    require("telescope.builtin").git_files(gopts)
  else
    fopts.results_title = "CWD: " .. vim.fn.getcwd()
    require("telescope.builtin").find_files(fopts)
  end
end
-- find files with gitfiles & fallback on find_files
key_map("n", ";p", [[<Cmd>lua require'le.telescope'.project_files()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ grep_wiki: ;w
function M.grep_wiki()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/Dropbox/vimwiki",
    "~/Dropbox/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2020_Fall_Math221/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2021_Spring_Math221/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2021_Spring_Math362/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2021_Fall_Math5870/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2021_Fall_STAT3600/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/2022_Spring_Math7210/vimwiki",
    "~/Dropbox/workspace/svn/Job-applications/homepage/Auburn/vimwiki",
    "~/Dropbox/workspace/svn/Article-Feynman-Kac-Formula-FractionalBM/Rough-in-time-Xia/vimwiki",
    "~/Dropbox/Teaching/svn_teaching/Teaching_Tools",
  }
  opts.file_ignore_patterns = {
      "%.html",
  }
  opts.prompt_prefix = "   "
  opts.prompt_title = " Live grep Le's Wiki contents"
  opts.path_display = { "smart" }
  require("telescope.builtin").live_grep(opts)
end
key_map("n", ";w", [[<Cmd>lua require'le.telescope'.grep_wiki()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ telescope vm: ;ww, for files.
key_map("n", ";ww", [[<Cmd>Telescope vw<CR>]], { noremap = true, silent = true })
--}}}
--{{{ grep_research_latex: .r
--{{{ my_ignores: First define the ignore files:
local my_ignores ={
      "others",
      "%.py",
      "%.m",
      "%.nb",
      "%.pdf",
      "%.log",
      "%.gz",
      "%.gz",
      "%.toc",
      "%.tex~",
      "%.png",
      "%.jpeg",
      "%.jpg",
      "%.eps",
      "%.ps",
      "%.backup",
      "%.dvi",
      "%~",
      "%.aux",
      "%.out",
      "%.brf",
      "%.djvu",
      "%.kilepr",
      "%.JPG",
      "%.sty",
      "%.blg",
      "%.nls",
      "%.nlo",
      "%.lot",
      "%.maf",
      "%.svn",
      "%.dat",
      "%.cls",
      "%.html",
      "%.lst",
      "%.ilg",
      "%.svg",
      "%.pfg",
      "%.bak",
      "%.asv",
      "%.prj",
      "%.xcf",
      "%.php",
      "%.asv",
      "%.table",
      "%.gnuplot",
      "%.r",
      "%.js",
      "%.h",
      "%.ind",
      "%.zip",
      "%.doc",
      "%.docx",
}--}}}
function M.grep_research_latex()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/Dropbox/workspace/svn/",
  }
  -- opts.file_ignore_patterns = table.insert(my_ignores, "%.txt")
  opts.file_ignore_patterns = my_ignores
  opts.prompt_prefix = "   "
  opts.prompt_title = " Live grep Le's research directory"
  opts.path_display = { "smart" }
  require("telescope.builtin").live_grep(opts)
end
key_map("n", ".r", [[<Cmd>lua require'le.telescope'.grep_research_latex()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ find_research_latex: .f
function M.find_research_latex()
  require("telescope.builtin").find_files {
    prompt_title = " Find Latex files",
    path_display = { "smart" },
    cwd = "~/Dropbox/workspace/svn/",
    file_ignore_patterns = my_ignores,
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end
key_map("n", ".f", [[<Cmd>lua require'le.telescope'.find_research_latex()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ search_research_bibitem: .t, under the current directory
function M.search_research_bibitem()
  require("telescope.builtin").grep_string {
    prompt_title = " Search bibitem",
    prompt_prefix = " ",
    results_title = "Searching for bitiem",
    path_display = { "smart" },
    search = "bibitem",
  }
end
key_map("n", ".t", ":lua require'le.telescope'.search_research_bibitem()<CR>", { noremap = true, silent = true })
--}}}
--{{{ search_research_bibitem: .c, under the current directory
-- function M.all_bibtex_items()
--   require("telescope.builtin").tags {
--     prompt_title = " Search tags",
--     prompt_prefix = " ",
--     results_title = "Searching for tags",
--     path_display = { "smart" },
--   }
-- end
-- key_map("n", ".c", ":lua require'le.telescope'.all_bibtex_items()<CR>", { noremap = true, silent = true })
key_map("n", ".c", ":Tags<cr>", { noremap = true, silent = true })
--}}}
--{{{ browse_research_latex: .e, not working now.
function M.browse_research_latex()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " Browse all latex files",
    prompt_prefix = " ﮷ ",
    cwd = "~/Dropbox/workspace/svn/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end
key_map("n", ".e", [[<Cmd>lua require'le.telescope'.browse_research_latex()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ find_mydotfiles: ;d
function M.find_mydotfiles()
  require("telescope.builtin").find_files {
    prompt_title = " my dotfiles Find",
    results_title = "Le's Config Files Results",
    path_display = { "smart" },
    hidden = true,
    search_dirs = {
      -- "~/.oh-my-zsh/custom/",
      "~/Dropbox/mydotfiles/",
      -- "~/.config",
    },
    file_ignore_patterns = {
      "tmux_resurrect",
      "icons",
    },
    -- cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end
key_map("n", ";d", [[<Cmd>lua require'le.telescope'.find_mydotfiles()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ grep_dotfiles: ;s
function M.grep_dotfiles()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/Dropbox/mydotfiles/",
  }
  opts.file_ignore_patterns = {
      "%.html",
  }
  opts.prompt_prefix = "   "
  opts.prompt_title = " Grep Le's dotfiles"
  opts.path_display = { "smart" }
  require("telescope.builtin").live_grep(opts)
end
key_map("n", ";s", [[<Cmd>lua require'le.telescope'.grep_dotfiles()<CR>]], { noremap = true, silent = true })
--}}}
--{{{ file_explorer: from current directory, ;f
function M.file_explorer()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " File Browser",
    path_display = { "smart" },
    cwd = "~",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end
key_map(
  "n",
  ";f",
  [[<Cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]],
  { noremap = true, silent = true }
)
--}}}
return M
