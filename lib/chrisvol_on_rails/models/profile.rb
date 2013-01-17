require 'digest/md5'
class Profile < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection
  
  attr_accessor :password, :password_confirmation
  
  before_save :update_password
  
  has_many :positions, :class_name => :ProfilePosition, :autosave => false
  has_many :educations, :class_name => :ProfileEducation, :autosave => false
  has_many :publications, :class_name => :ProfilePublication, :autosave => false
  has_many :skills, :class_name => :ProfileSkill, :autosave => false
  has_many :languages, :class_name => :ProfileLanguage, :autosave => false
  has_many :im_accounts, :class_name => :ProfileIMAccount, :autosave => false
  has_many :profile_phones, :class_name => :ProfilePhone, :autosave => false
  has_many :volunteer_experiences, :class_name => :ProfileVolunteerExperience, :autosave => false
  has_many :volunteer_causes, :class_name => :ProfileVolunteerCause, :autosave => false
  has_many :volunteer_organizations, :class_name => :ProfileVolunteerOrganization, :autosave => false
  has_many :phones, :class_name => :ProfilePhone, :autosave => false
  has_many :courses, :class_name => :ProfileCourse, :autosave => false
  has_many :certifications, :class_name => :ProfileCertification, :autosave => false
  
  validates_confirmation_of :password, :unless => Proc.new { |p| p.password.blank? && p.password_confirmation.blank? }
  validates_presence_of :phones, :if => Proc.new {|profile| profile.uprofile.existing_individual? }
  
  def uprofile
    return nil unless drupal_uprofile_nid
	@uprofile ||= Urbmi5Drupal::Uprofile.find_by_nid(drupal_uprofile_nid)
  end
  
  def current_positions
    self.positions.find_all_by_is_current(true)
  end
  
  def previous_positions
    self.positions.find_all_by_is_current(false)
  end
  
  def latest_education
    # TODO: apply bitmask before sorting
    self.educations.find(:first, :order => ["start_date desc"])
  end
  
  def update_password
	unless password.blank? or password_confirmation.blank?
	  uprofile.user.pass = Digest::MD5.hexdigest(password)
	end
  end
  
end
