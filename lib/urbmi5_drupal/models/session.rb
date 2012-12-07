module Urbmi5Drupal
  class Session < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = 'voleng_sessions'
    self.primary_key = 'sid'
    belongs_to :user, :class_name => "Urbmi5Drupal::User", :primary_key => "uid", :foreign_key => "uid"
  end
end
