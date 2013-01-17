module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_uprofile'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode

	validate do |up|
	  up.validates :field_first_name_value, :field_last_name_value, :presence => true
	  up.validates :field_site_use_type_value, 
	               :presence  => true,
			       :inclusion => {:in => ["Both", "Church", "Organization", "Volunteer"]}
	  up.validates :field_birth_year_value, 
			       :numericality => {:only_integer => true, :greater_than => 999, :less_than => 10000},
			       :allow_nil    => !up.individual_past_step_one?
	end
	
	def profile
	  Profile.find_by_drupal_uprofile_nid(self.nid)
	end
	
	def location_instance
	  @location_instance ||= (self.node.location_instances.first || self.node.location_instances.new(:vid => self.node.vid))
	end
	
    def location
	  @location = (location_instance.location || location_instance.build_location)
    end
	
	def state
	  if new_record? or
	  user.blank? or
	  user.name_was.blank? or
	  user.mail_was.blank? or
	  field_first_name_value_was.blank? or
	  field_last_name_value_was.blank?
	    :step_one
	  elsif individual and (
	    field_birth_year_value_was.blank? or
		profile.blank? or
		profile.phones.blank? or
		location.blank? or
		location.country_was.blank? or
		location.postal_code_was.blank?
	  )
	    :step_two
	  else
	    :complete
	  end
	end
	
	def step_one?
	  state == :step_one
	end
	
	def step_two?
	  state == :step_two
	end
	
	def complete?
	  state == :complete
	end
	
	def past_step_one?
	  step_two? or complete?
	end
	
	def individual?
	  case field_site_use_type_value
	  when "Both", "Volunteer" then true
	  else false
	  end
	end
	
	def individual_past_step_one?
	  individual? and past_step_one?
	end
  end
end
