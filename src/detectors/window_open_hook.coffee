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
    serviceNames = []
    
    for url in @urls
      for name, pattern of patterns
        serviceNames.push(name) if url.match? pattern
    
    serviceNames