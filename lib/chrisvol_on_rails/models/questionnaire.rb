class Questionnaire < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  has_many :questions, :primary_key => "id", :foreign_key => "questionnaire_id", :order => "position ASC"
  has_many :opportunities_questionnaires
  belongs_to :organization, :class_name => "Urbmi5Drupal::Organization", :primary_key => "nid", :foreign_key => "organization_nid"
 
  validates_presence_of :title
  
  def opportunity
    Urbmi5Drupal::Position.find_by_nid(self.opportunity_nid)
  end
  
  def published?
    !opportunities_questionnaires.empty?  
  end
 
end