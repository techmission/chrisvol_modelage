require 'techmi5_voleng/modelage.rb'

module Urbmi5Drupal
  class Location < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location"
    self.primary_key = "lid"
	has_many :phones, :class_name => "Urbmi5Drupal::Phone", :primary_key => :lid, :foreign_key => :lid
	has_many :location_instances, :class_name => "Urbmi5Drupal::LocationInstance", :primary_key => :lid, :foreign_key => :lid
	
	validates_inclusion_of :country, :in => Techmi5Voleng::Country.find(:all).map{|c| c.iso}, :if => :belongs_to_individual?
	validates_presence_of :postal_code, :if => :belongs_to_individual?
	
	def belongs_to_individual?
	  location_instaces.
	  map{|li| Urbmi5Drupal::Uprofile.find_by_nid(li.nid)}.
	  compact.
	  select{|up| up.individual?}.
	  length > 0
	end
  end
end
