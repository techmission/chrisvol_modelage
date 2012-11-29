module Urbmi5Drupal
  class Session < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    set_table_name 'voleng_sessions'
    belongs_to :user, :class_name => "Urbmi5Drupal::User", :primary_key => "uid", :foreign_key => "uid"
  end
end
