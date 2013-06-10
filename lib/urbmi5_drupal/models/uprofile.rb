module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_uprofile'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode

    validates :field_first_name_value, 
              :field_last_name_value, 
          :presence => true
    validates :field_site_use_type_value, 
              :presence  => true,
          :inclusion => {:in => ["Both", "Church", "Organization", "Volunteer"]}
    validates :field_birth_year_value, 
          :numericality => {:only_integer => true, :greater_than => 999, :less_than => 10000},
          :allow_blank => true
    validates :field_birth_year_value,
              :presence => true,
          :if       => :individual_past_step_one?
    
    after_save :save_taxonomies
    
    attr_accessor :public_dir, :looking_for, :service_areas
    
    def profile
      Profile.find_by_drupal_uprofile_nid(self.nid)
    end
    
    def location_instance
      @location_instance ||= (
              self.location.location_instances.first || 
              self.location.location_instances.new(:vid => self.node.vid, :nid => self.node.nid, :location => location)
            )
    end
    
          def location
      return @location if @location
      l = (self.node.locations.first || self.node.locations.new)
      l.uprofile = self
      @location = l
          end
    
    def state
      if new_record? or
      user.blank? or
      user.name_was.blank? or
      user.mail_was.blank? or
      field_first_name_value_was.blank? or
      field_last_name_value_was.blank?
        :step_one
      elsif individual? and (
        field_birth_year_value_was.blank? or
      profile.blank? or
      profile.phones.blank? or
      location.blank? or
      location.country_was.blank? or (
                    location.country_was.upcase == "US" and
        location.postal_code_was.blank?
                  )
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
    
    def load_taxonomies
      self.public_dir = self.node.terms.find_all_by_vid(279).map{|t| t.tid}
      self.looking_for = self.node.terms.find_all_by_vid(332).map{|t| t.tid}
      self.service_areas = self.node.terms.find_all_by_vid(32).map{|t| t.tid}
    end
    
    private
    
    def save_taxonomies
      self.node.update_taxonomy!(332, self.looking_for) unless self.looking_for.nil?
      self.node.update_taxonomy!(279, self.public_dir) unless self.public_dir.nil?
      self.node.update_taxonomy!(32,  self.service_areas) unless self.service_areas.nil?
    end
  end
end
