require 'techmi5_voleng/modelage.rb'

module Urbmi5Drupal
  class Location < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location"
    self.primary_key = "lid"
	has_many :phones, :class_name => "Urbmi5Drupal::Phone", :primary_key => :lid, :foreign_key => :lid
	has_many :location_instances, :class_name => "Urbmi5Drupal::LocationInstance", :primary_key => :lid, :foreign_key => :lid
	
	validate do |l|
	  unless uprofile.blank?
	    validates :country,
       	          :inclusion => {:in => Techmi5Voleng::Country.find(:all).map{|c| c.iso}},
			      :allow_nil => !l.uprofile.individual_past_step_one?
        if l.country.upcase == "US" and l.uprofile.individual_past_step_one?
		  validates :postal_code, :presence => true  
        end		
	  end
	end
	
	attr_accessor :uprofile
  end
end
