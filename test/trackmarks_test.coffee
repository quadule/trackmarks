describe "Trackmarks", ->
  it "detects nothing after initialization", ->
    services = new Trackmarks().detectedServices()
    expect(services).toEqual []
  
  
  describe "ScriptTagMatcher", ->
    services =
      "Instapaper": 'fake://instapaper.com/'
      "Read It Later": 'fake://readitlaterlist.com/'
      "Readability": 'fake://readability.com/'
      "Twitter": 'fake://platform.twitter.com/bookmarklets'
    
    for service, url of services
      do (service, url) ->
        it "detects a #{service} script tag", ->
          trackmarks = new Trackmarks ['ScriptTagMatcher']
          
          tag = document.createElement 'script'
          tag.src = url
          document.documentElement.appendChild tag
          
          expect(trackmarks.detectedServices()).toContain service
          
          document.documentElement.removeChild tag
  
  
  describe "WindowOpenHook", ->
    services =
      "Facebook": 'facebook.com/share'
      "Tumblr": 'tumblr.com/share'
      "Delicious": 'delicious.com/save?'
    
    for service, url of services
      do (service, url) ->
        it "detects a #{service} window opening", ->
          trackmarks = new Trackmarks ['WindowOpenHook']
          
          # stub to prevent popups from actually opening
          trackmarks.detectors.WindowOpenHook.opener = ->
          
          window.open url
          expect(trackmarks.detectedServices()).toContain service