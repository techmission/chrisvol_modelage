module Urbmi5Drupal
  class User < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    set_table_name 'um_users'
  end
end
