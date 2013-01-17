module ChrisvolModelage
  def self.db_connect(model, yml_key)
    yml_key = yml_key.to_s
    yml_key += "_#{ENV['RAILS_ENV']}" if ENV['RAILS_ENV']
	puts yml_key
    model.establish_connection(YAML.load(File.read('config/database.yml'))[yml_key])
  end
end
