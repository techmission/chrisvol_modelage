Gem::Specification.new do |s|
  s.name = "chrisvol_modelage"
  s.version = "1.0.0"
  s.date = "2012-11-12"
  s.summary = "Active Record models for ChristianVolunteering database"
  s.description = "Active Record models for ChristianVolunteering database"
  s.authors = ["Jim Gummeson"]
  s.email = "jim@techmission.org"
  s.files = ["lib/chrisvol_modelage.rb", "lib/models/node.rb", "lib/models/uprofile.rb"]
  s.add_dependency("activerecord", ["= 2.3.5"])
end
