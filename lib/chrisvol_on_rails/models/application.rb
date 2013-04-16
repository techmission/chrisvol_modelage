class Application < ActiveRecord::Base
  belongs_to :opportunity, :class_name => "Urbmi5Drupal::Opportunity", :foreign_key => :opportunity_nid, :primary_key => :nid
end