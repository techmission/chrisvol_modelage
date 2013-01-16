module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_uprofile'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode

    validates_presence_of :field_first_name_value, :field_last_name_value
	validates_presence_of :field_site_use_type_value, :in => ["Both", "Church", "Organization", "Volunteer"]
	validates :field_birth_year_value, 
	          :presence     => true, 
			  :numericality => {:only_integer => true, :greater_than => 999, :less_than => 10000},
			  :if           => :existing_individual?
	
	def location_instance
	  @location_instance ||= (self.node.location_instances.first || self.node.location_instances.new(:vid => self.node.vid))
	end
	
    def location
	  @location = (location_instance.location || location_instance.build_location)
    end
	
	def existing_individual?
	  !new_record? and individual?
	end
	
	def individual?
	  case field_site_use_type_value
	  when "Both", "Individual" then true
	  else false
	end
  end
end
