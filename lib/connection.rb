module ChrisvolModelage
  def self.db_connect(model, yml_key)
	yml_key = [yml_key, ENV['RAILS_ENV']].compact.join("_")
    model.establish_connection(YAML.load(File.read('config/database.yml'))[yml_key])
  end
end
