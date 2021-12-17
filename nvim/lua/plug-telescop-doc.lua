require("telescope-doc").open_path({
    -- Base directory (default : project root)
    cwd = "$HOME/Documents/",
    -- Pdf viewer (default : "$READER" or "zathura" or "")
    pdf_viewer = "zathura",
    -- Html viewer (default : "xdg-open")
    html_viewer = "xdg-open",

    -- Fork the viewer process (default : true)
    -- (available: false, true)
    fork_process = true,
    -- Open mode to others files in neovim (default : "vsplit")
    -- (available: "edit", "split", "vsplit", "tab")
    open_mode = "vsplit"
})
