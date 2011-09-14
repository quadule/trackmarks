describe "Trackmarks", ->
  it "detects nothing after initialization", ->
    detected = new Trackmarks('all').detect()
    expect(detected).toEqual []
  
  for name of Trackmarks.Service
    it "simulates the #{name} service", ->
      trackmarks = new Trackmarks('all')
      trackmarks.services[name].simulate()
      expect(trackmarks.detect()).toEqual [name]