class window.Trackmarks
  this.Detector = {}
  
  constructor: (detectorNames) ->
    @detectors = {}
    
    if detectorNames
      @detectors[name] = new Trackmarks.Detector[name] for name in detectorNames
    else
      @detectors[name] = new detector for name, detector of Trackmarks.Detector
  
  detectedServices: ->
    serviceNames = []
    
    for key, detector of @detectors
      serviceNames = serviceNames.concat detector.detectedServices()
    
    serviceNames