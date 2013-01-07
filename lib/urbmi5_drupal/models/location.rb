module Urbmi5Drupal
  class Location < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location"
    self.primary_key = "lid"
	has_many :phones, :class_name => "Urbmi5Drupal::Phone", :primary_key => :lid, :foreign_key => :lid
  end
end
