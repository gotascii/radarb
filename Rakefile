# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  load 'tasks/setup.rb'
end

ensure_in_path 'lib'
require 'radarb'

task :default => 'test'

PROJ.name = 'radarb'
PROJ.authors = 'Justin Marney'
PROJ.email = 'justin.marney@viget.com'
PROJ.url = 'http://github.com/vigetlabs/radarb'
PROJ.version = Radarb::VERSION
PROJ.rubyforge.name = 'radarb'
PROJ.test.files = FileList['test/**/*_test.rb']
PROJ.spec.opts << '--color'

# EOF
