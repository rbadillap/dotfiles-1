command: "osascript ~/dotfiles/tmux/spotify.scpt"

refreshFrequency: 100

render: (output) -> """
  <div>#{output}</div>
"""

style: """
  top: 10px
  left: 10px
  -webkit-backdrop-filter: blur(20px)
  font-size: 24px
  font-family: SF Mono
  font-weight: 300
  color: #fff
  background-color: rgba(#000, 0.1)
  border-radius: 20px
  padding: 20px 40px
"""

update: (output, elem) ->
  $(elem).html(output)
