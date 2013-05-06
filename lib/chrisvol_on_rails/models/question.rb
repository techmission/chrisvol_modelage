class Question < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :questionnaire
  has_many :answer_options, :primary_key => :id, :foreign_key => :question_id
  
  acts_as_list :scope => :questionnaire
  attr_accessor :new_answer_options
  after_save :save_options, :unless => Proc.new{|q| q.new_answer_options.nil?}
  
  validates_presence_of :format
  validates_presence_of :text
  validates_presence_of :new_answer_options, :if => Proc.new{|q| q.answer_is_selected?}
  
  ANSWER_FORMAT_SINGLE_LINE_TEXT = "single_line_text"
  ANSWER_FORMAT_MULTI_LINE_TEXT  = "multi_line_text"
  ANSWER_FORMAT_MENU_SELECT      = "menu_select"
  ANSWER_FORMAT_RADIO_SELECT     = "radio_select"
  ANSWER_FORMAT_CHECKBOX_SELECT  = "checkbox_select"
  
  TEXT_ANSWER_FORMATS = [
    ANSWER_FORMAT_SINGLE_LINE_TEXT,
    ANSWER_FORMAT_MULTI_LINE_TEXT
  ]
  
  SELECT_ANSWER_FORMATS = [
    ANSWER_FORMAT_MENU_SELECT,
    ANSWER_FORMAT_RADIO_SELECT,
    ANSWER_FORMAT_CHECKBOX_SELECT
  ]
  
  def answer_is_selected?
    SELECT_ANSWER_FORMATS.include?(self.format)
  end
  
  private
  
  def save_options
    self.answer_options = self.new_answer_options
  end
end