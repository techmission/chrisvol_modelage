class OpportunitiesQuestionnaire < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :opportunity, :class_name => "Urbmi5Drupal::Position", :foreign_key => :opportunity_nid, :primary_key => :nid
  belongs_to :questionnaire
  has_many :instances, :class_name => "QuestionnaireInstance"
end