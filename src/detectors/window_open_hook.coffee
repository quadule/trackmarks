class window.Trackmarks.Detector.WindowOpenHook
  patterns =
    "Facebook": /facebook\.com\/share/i
    "Tumblr": /tumblr\.com\/share/i
    "Delicious": /delicious\.com\/save\?/i
  
  constructor: ->
    @urls = urls = []
    @opener = window.open
    
    window.open = =>
      @opener.apply null, arguments
      @urls.push arguments[0]
    
  detectedServices: ->
    services = {}
    
    for url in @urls
      for name, pattern of patterns
        services[name] = null if url.match? pattern
    
    services