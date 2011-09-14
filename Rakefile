task :default => :test

task :test => :build do
  `open test/runner.html`
end

task :build do
  compile
end

task :watch do
  compile '--watch'
end

def compile(options='')
  `coffee #{options} --join trackmarks.js --compile src/*.coffee src/services/*.coffee`
  `coffee #{options} --join test/trackmarks_test.js --compile test/*.coffee`
end