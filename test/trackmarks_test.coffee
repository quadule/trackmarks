describe "Trackmarks", ->
  it "detects nothing after initialization", ->
    services = new Trackmarks().detectedServices()
    expect(services).toEqual []
  
  describe "ScriptTagMatcher", ->
    ScriptTagMatcher = Trackmarks.Detector.ScriptTagMatcher
    
    services =
      "Instapaper": 'fake://instapaper.com/'
      "Read It Later": 'fake://readitlaterlist.com/'
      "Readability": 'fake://readability.com/'
    
    for service, url of services
      do (service, url) ->
        it "should detect a #{service} script tag", ->
          trackmarks = new Trackmarks ['ScriptTagMatcher']
          
          tag = document.createElement 'script'
          tag.src = url
          document.documentElement.appendChild tag
          
          expect(trackmarks.detectedServices()).toContain service
          
          document.documentElement.removeChild tag