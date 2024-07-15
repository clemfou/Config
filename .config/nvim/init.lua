cmd = vim.cmd
opt = vim.opt
api = vim.api
env = vim.env
fn = vim.fn

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug ('junegunn/fzf.vim')
    Plug ('junegunn/fzf')
    Plug ('tpope/vim-surround')
    Plug ('tpope/vim-fugitive')
vim.call('plug#end')

utils = require('utils')
require('settings')
require('colors')
require('autocmd')
require('marksline')
require('keymaps')
require('statusline')
