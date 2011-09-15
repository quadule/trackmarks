class window.Trackmarks
  this.Detector = {}
  
  constructor: (@callback, detectorNames) ->
    @detectors = {}
    @seenServices = []
    
    if detectorNames
      @detectors[name] = new Trackmarks.Detector[name] for name in detectorNames
    else
      @detectors[name] = new detector for name, detector of Trackmarks.Detector
    
    setInterval (=> this.detectNewServices()), 333 if @callback?
  
  detectNewServices: ->
    for name, data of @detectedServices()
      unless name in @seenServices
        @callback name, data
        @seenServices.push name
  
  detectedServices: ->
    services = {}
    
    for key, detector of @detectors
      services[name] = data for name, data of detector.detectedServices()
    
    services