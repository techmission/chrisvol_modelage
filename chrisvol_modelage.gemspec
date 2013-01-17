Gem::Specification.new do |s|
  s.name = "chrisvol_modelage"
  s.version = "1.8.0"
  s.date = "2012-11-12"
  s.summary = "Active Record models for ChristianVolunteering database"
  s.description = "Active Record models for ChristianVolunteering database"
  s.authors = ["Jim Gummeson"]
  s.email = "jim@techmission.org"
  s.files = [
    "lib/chrisvol_modelage.rb", 
    "lib/connection.rb",
    "lib/urbmi5_drupal/modelage.rb",
    "lib/urbmi5_drupal/connection.rb",
    "lib/urbmi5_drupal/acts_as_node.rb",
    "lib/urbmi5_drupal/models/node.rb", 
    "lib/urbmi5_drupal/models/uprofile.rb",
    "lib/urbmi5_drupal/models/user.rb",
    "lib/urbmi5_drupal/models/session.rb",
    "lib/urbmi5_drupal/models/location.rb",
    "lib/urbmi5_drupal/models/location_instance.rb",
    "lib/urbmi5_drupal/models/phone.rb",
    "lib/urbmi5_data/modelage.rb",
    "lib/techmi5_voleng/modelage.rb",
	"lib/techmi5_voleng/connection.rb",
	"lib/techmi5_voleng/models/country.rb",
	"lib/techmi5_voleng/models/province.rb",
	"lib/chrisvol_on_rails/modelage.rb",
    "lib/chrisvol_on_rails/connection.rb",
    "lib/chrisvol_on_rails/models/profile"
    "lib/chrisvol_on_rails/models/profile_certification"
    "lib/chrisvol_on_rails/models/profile_course"
    "lib/chrisvol_on_rails/models/profile_education"
    "lib/chrisvol_on_rails/models/profile_language"
    "lib/chrisvol_on_rails/models/profile_phone"
    "lib/chrisvol_on_rails/models/profile_position"
    "lib/chrisvol_on_rails/models/profile_publication"
    "lib/chrisvol_on_rails/models/profile_skill"
    "lib/chrisvol_on_rails/models/profile_volunteer_cause"
    "lib/chrisvol_on_rails/models/profile_volunteer_experience"
    "lib/chrisvol_on_rails/models/profile_volunteer_organization"
  ]
  for d in ["activerecord", "safe_attributes", "composite_primary_keys"]
    s.add_dependency(d)
  end
end
