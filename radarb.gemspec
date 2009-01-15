Gem::Specification.new do |s|
  s.name     = "radarb"
  s.version  = "1.1.1"
  s.date     = "2008-01-15"
  s.summary  = "outside.in radar API wrapper."
  s.email    = "justin.marney@viget.com"
  s.homepage = "http://github.com/vigetlabs/radarb"
  s.description = "A ruby gem that makes using the http://outside.in/ API simple."
  s.has_rdoc = true
  s.authors  = ["Justin Marney"]
  s.files    = ["History.txt", 
		"README.txt",
		"Rakefile",
		"radarb.gemspec",
		"lib/radarb.rb",
		"lib/radarb/collectable.rb",
		"lib/radarb/fetch.rb",
		"lib/radarb/place.rb",
		"lib/radarb/radar.rb",
		"lib/radarb/tag.rb"]
  s.test_files = ["test/test_helper.rb", 
      "test/radarb_test.rb",
      "test/radarb/radar_test.rb",
      "test/radarb/collectable_test.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("gotascii-happymapper", ["> 0.0.0"])
  s.add_dependency("curb", ["> 0.0.0"])
end
