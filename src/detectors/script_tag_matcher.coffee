window.Trackmarks.Detector.ScriptTagMatcher = class ScriptTagMatcher
  patterns =
    "Instapaper": /instapaper\.com\//i
    "Read It Later": /readitlaterlist\.com\//i
    "Readability": /readability\.com\//i
    
  detectedServices: ->
    serviceNames = []
    
    for tag in document.getElementsByTagName('script')
      src = tag.attributes.src?.value
      
      for name, pattern of patterns
        serviceNames.push(name) if src?.match? pattern
    
    serviceNames