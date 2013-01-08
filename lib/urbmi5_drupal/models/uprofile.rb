module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_uprofile'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode

    validates_presence_of :field_first_name_value, :field_last_name_value

    def location
      @location ||= (self.node.locations.first || self.node.locations.new)
    end
  end
end
