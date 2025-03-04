return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set("n", "<m-f>", ":FloatermNew<CR>", {})
		vim.keymap.set("n", "<m-t>", ":FloatermToggle<CR>", {})
		vim.keymap.set("t", "<m-t>", "<c-\\><c-n>:FloatermToggle<CR>", {})
		vim.keymap.set("n", "<m-g>", ":FloatermNew --autoclose=0 gcc % -o %< && ./%<<CR>", {})
		vim.keymap.set("n", "<m-j>", ":FloatermNew --autoclose=0 javac % && java $(basename % .java)<CR>", {})
		vim.keymap.set("n", "<m-p>", ":FloatermNew --autoclose=0 python3 %<CR>", {})
		vim.keymap.set("n", "<m-P>", ":FloatermNew --autoclose=0 poetry run view<CR>", {})
		vim.keymap.set("n", "<m-T>", ":FloatermNew --autoclose=0 ant <CR>", {})
	end,
}
