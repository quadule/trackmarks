window.Trackmarks = class Trackmarks
  this.Service = {}
  
  constructor: (serviceNames) ->
    @services = {}
    
    if serviceNames == 'all'
      @services[name] = new service for name, service of Trackmarks.Service
    else
      @services[name] = new Trackmarks.Service[name] for name in serviceNames
  
  detect: ->
    name for name, service of @services when service.detect()