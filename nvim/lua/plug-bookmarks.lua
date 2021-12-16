require('telescope').setup {
  extensions =
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
      selected_browser = 'qutebrowser',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,
      firefox_profile_name = nil,
    },
  }
}
