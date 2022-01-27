
config.load_autoconfig(False)

# bindings
config.bind('xb', 'config-cycle tabs.show always never')

# colors
# c.colors.tabs.bar.bg = ""

# darkmode
c.colors.webpage.darkmode.enabled       = True
c.colors.webpage.darkmode.policy.images = "never"

# tab bar
c.tabs.last_close   = "close"
c.tabs.title.format = "{private}{audio}{index}: {current_title}"

# status bar
c.statusbar.widgets = ["keypress", "progress", "url", "scroll", "history", "tabs", "text:qutebrowser"]

# downloads
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt    = True
c.downloads.location.remember  = True

c.content.blocking.enabled = True
c.content.blocking.method  = "both"
