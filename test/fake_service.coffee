Trackmarks.Service.Fake = class Fake
  @active = false
  
  # Simulates the use of the bookmarklet.
  simulate: ->
    @active = true
  
  # Returns true if the bookmarklet was used.
  detect: ->
    @active