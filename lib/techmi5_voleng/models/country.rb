module Techmi5Voleng
  class Country < ActiveRecord::Base
    include ChrisvolModelage::Techmi5Voleng::Connection

    self.table_name_prefix = "techmi5_voleng."
    self.table_name = "country"
	self.primary_key = "iso"
	
	def self.usa
	  self.find(:first, :conditions => "UCASE(iso3) = 'USA'")
	end
	
	def self.canada
	  self.find(:first, :conditions => "UCASE(iso3) = 'CAN'")
	end
	
	def provinces
	  Techmi5Voleng::Province.find(:all, :conditions => "UCASE(country_code) = UCASE('#{self.iso3}')")
	end
  end
end
