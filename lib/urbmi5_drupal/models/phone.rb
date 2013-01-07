module Urbmi5Drupal
  class Phone < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location_phone"
    belongs_to :location, :class_name => "Urbmi5Drupal::Location", :primary_key => "lid", :foreign_key => "lid"
  end
end
