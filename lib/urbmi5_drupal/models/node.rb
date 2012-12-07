require 'safe_attributes/base'
module Urbmi5Drupal
  class Node < ActiveRecord::Base
    include SafeAttributes::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name "um_node"

    has_many :location_instances, :class_name => "Urbmi5Drupal::LocationInstance", :primary_key => "nid", :foreign_key => "nid"
    has_many :locations, :through =>  :location_instances

    def self.inheritance_column
      nil
    end
  end
end
