module Urbmi5Drupal
  class Term < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_term_data"
    self.primary_key = "lid"

    belongs_to :vocabulary,
               :class_name => "Urbmi5Drupal::Vocabulary",
               :primary_key => "vid",
               :foreign_key => "vid"
  end
end
