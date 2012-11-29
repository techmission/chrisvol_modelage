module Urbmi5Drupal
  class Uprofile < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    set_table_name 'um_content_type_uprofile'
    belongs_to :node, :class_name => "Urbmi5Drupal::Node", :primary_key => "nid", :foreign_key => "nid"
  end
end
