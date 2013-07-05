class QuestionnaireInstance < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :opportunities_questionnaire
  belongs_to :profile
  has_many :text_answers, :validate => true
  has_many :select_answers, :validate => true
  
  validates_presence_of :profile
  validate :require_answers
  
  def opportunity
    opportunities_questionnaire.opportunity  
  end
  
  def questionnaire
    opportunities_questionnaire.questionnaire
  end
  
  def answer(question)
    if question.answer_is_selected?
      answers = select_answers.select{|sa| sa.option.question_id == question.id}
      question.format == Question::ANSWER_FORMAT_CHECKBOX_SELECT ? answers : answers.first
    else
      text_answers.select{|ta| ta.question_id == question.id}.first
    end
  end
  
  def filled_out_by?(user)
    user.uid == self.profile.uprofile.node.uid
  end
  
  def associated_org_owned_by?(user)
    user.organizations.map{|o| o.nid}.include?(self.opportunities_questionnaire.questionnaire.organization.nid)
  end
  
  def viewable_by?(user)
    filled_out_by?(user) or associated_org_owned_by?(user)
  end
  
  private
  
  def require_answers
    answer_map = {}
    text_answers.each do |ta| 
      answer_map[ta.question.id] ||= []
      answer_map[ta.question.id] << ta
    end
    select_answers.each do |sa|
      answer_map[sa.option.question.id] ||= []
      answer_map[sa.option.question.id] << sa
    end
    
    opportunities_questionnaire.questionnaire.questions.each do |question|
      answers = answer_map[question.id]
      if !(question.format == Question::ANSWER_FORMAT_CHECKBOX_SELECT) &&
         (answers.blank? || (Question::TEXT_ANSWER_FORMATS.include?(question.format) && answers.first.text.blank?))
        errors.add(:base, "Question #{question.position} is required")
      end
    end
  end
end