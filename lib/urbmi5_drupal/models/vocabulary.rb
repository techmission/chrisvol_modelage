require 'safe_attributes/base'
module Urbmi5Drupal
  class Vocabulary < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = "um_vocabulary"
    self.primary_key = "nid" 
    
    has_many :terms, 
             :class_name => "Urbmi5Drupal::Term", 
             :primary_key => "vid",
             :foreign_key => "vid"
  end
end
