module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_uprofile'
    self.primary_key = 'nid'    

    belongs_to :node, :class_name => "Urbmi5Drupal::Node", :primary_key => "nid", :foreign_key => "nid"

    def location
      self.node.locations.first
    end
  end
end
