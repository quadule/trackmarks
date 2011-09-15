class window.Trackmarks.Detector.ScriptTagMatcher
  patterns =
    "Instapaper": /instapaper\.com\//i
    "Read It Later": /readitlaterlist\.com\//i
    "Readability": /readability\.com\//i
    "Twitter": /platform\.twitter\.com\/bookmarklets/i
    
  detectedServices: ->
    services = {}
    
    for tag in document.getElementsByTagName('script')
      src = tag.attributes.src?.value
      
      for name, pattern of patterns
        services[name] = null if src?.match? pattern
    
    services