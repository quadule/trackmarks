window.Trackmarks.Service.Instapaper = class Instapaper
  simulate: ->
    script = document.createElement('script')
    script.src = "fake://instapaper.com/"
    document.body.appendChild script
    
  detect: ->
    for tag in document.getElementsByTagName('script')
      return true if tag.attributes.src?.value.match? /instapaper\.com\//