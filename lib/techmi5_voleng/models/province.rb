module Techmi5Voleng
  class Province < ActiveRecord::Base
    include ChrisvolModelage::Techmi5Voleng::Connection
    self.table_name = "country_stateprovince"
    self.primary_key = "state_code"   
	
    def country
      Techmi5Voleng::Country.find(:first, :conditions => "UCASE(iso3) = UCASE('#{self.country_code}')")
    end
  end
end
