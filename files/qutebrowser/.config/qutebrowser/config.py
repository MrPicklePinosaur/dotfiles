
config.load_autoconfig(False)

# general
c.zoom.default = "100%"

# bindings
config.bind('xb', 'config-cycle tabs.show always never')
config.bind(' m', 'spawn mpv {url}')
config.bind(' p', 'spawn --userscript qute-pass', mode='normal')
config.bind(' r', 'config-source')
config.bind('gh', 'tab-move -')
config.bind('gl', 'tab-move +')

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

# ad blocking
c.content.blocking.enabled = True
c.content.blocking.method  = "both"

# content rules
c.content.geolocation                     = False
c.content.autoplay                        = False
c.content.notifications.enabled           = False
c.content.desktop_capture                 = False
c.content.media.audio_capture             = False
c.content.media.audio_video_capture       = False
c.content.media.video_capture             = False
c.content.javascript.can_access_clipboard = False # this may be a bit annoying
c.content.notifications.enabled           = False

# fingerprint minimizing
c.content.headers.user_agent      = "Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0"
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.custom          = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.canvas_reading          = False
c.content.webgl                   = False

c.downloads.remove_finished = 5
