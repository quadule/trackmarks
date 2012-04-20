task :default => :test

task :test => :build do
  `open test/runner.html`
end

task :build do
  compile and uglify
end

task :watch do
  compile '--watch'
end

def compile(options='')
  `coffee #{options} --join trackmarks.js --compile src/`
  `coffee #{options} --join test/trackmarks_test.js --compile test/`
end

def uglify
  `uglifyjs -o trackmarks.js < trackmarks.js`
end
