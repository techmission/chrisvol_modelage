module Urbmi5Drupal
  class LocationInstance < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location_instance"
	self.primary_keys = [:nid, :lid]
    belongs_to :node, :class_name => "Urbmi5Drupal::Node", :primary_key => "nid", :foreign_key => "nid"
    belongs_to :location, :class_name => "Urbmi5Drupal::Location", :primary_key => "lid", :foreign_key => "lid"
  end
end
