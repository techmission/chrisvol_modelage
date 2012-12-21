module Urbmi5Drupal
  class TermNode < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_term_node"

    belongs_to :node, 
               :class_name  => "Urbmi5Drupal::Node",
               :primary_key => "nid",
               :foreign_key => "nid"
               
    belongs_to :term, 
               :class_name  => "Urbmi5Drupal::Term",
               :primary_key => "tid",
               :foreign_key => "tid"
  end
end
