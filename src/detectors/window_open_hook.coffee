class window.Trackmarks.Detector.WindowOpenHook
  patterns =
    "Delicious": /delicious\.com\/save\?/i
    "Facebook": /facebook\.com\/share/i
    "Tumblr": /tumblr\.com\/share/i
    "Wordpress": /(.*)\/wp-admin\/press-this\.php/i
  
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
        if matches = url.match? pattern
          if matches.length > 1
            services[name] = url: matches[1]
          else
            services[name] = null
    
    services