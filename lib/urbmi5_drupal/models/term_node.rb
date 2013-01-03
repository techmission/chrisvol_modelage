require 'composite_primary_keys'

module Urbmi5Drupal
  class TermNode < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_term_node"
    self.primary_keys = [:nid, :tid]

    before_save :set_defaults

    belongs_to :node, 
               :class_name  => "Urbmi5Drupal::Node",
               :primary_key => "nid",
               :foreign_key => "nid"
               
    belongs_to :term, 
               :class_name  => "Urbmi5Drupal::Term",
               :primary_key => "tid",
               :foreign_key => "tid"

    private

    def set_defaults
      self.auto_tag ||= 0
      self.timestamp ||= 0
      self.auto_tag_tid_source ||= 0
    end
  end
end
