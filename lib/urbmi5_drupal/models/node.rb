module Urbmi5Drupal
  class Node < ActiveRecord::Base
    include SafeAttributes::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
 
    self.table_name = "um_node"
    self.primary_key = :nid
	
    belongs_to :user, :class_name => "Urbmi5Drupal::User", :primary_key => "uid", :foreign_key => "uid"
    has_many :location_instances, :class_name => "Urbmi5Drupal::LocationInstance", :primary_key => "nid", :foreign_key => "nid"
    has_many :locations, :through =>  :location_instances
    has_many :term_nodes, :class_name => "Urbmi5Drupal::TermNode", :primary_key => "nid", :foreign_key => "nid"
    has_many :terms, :through => :term_nodes

    def self.inheritance_column
      nil
    end
	
	def update_taxonomy!(vid, tids)
	  old_terms = Set.new self.terms.find_all_by_vid(vid.to_i).map{|t| t.tid.to_i}
	  new_terms = Set.new tids.map{|tid| tid.to_i}
	
	  terms_to_delete = old_terms - new_terms
	  terms_to_insert = new_terms - old_terms
	
	  Urbmi5Drupal::Node.transaction do 
	    if terms_to_delete.length > 0
		  n = Urbmi5Drupal::TermNode.delete_all([
		    "nid = ? AND tid in(#{Array.new(terms_to_delete.length, "?").join(",")})",
		    self.nid
		  ] + terms_to_delete.to_a)  
		  raise ActiveRecord::Rollback unless n == terms_to_delete.length
		end
	    for tid in terms_to_insert
		  self.term_nodes.create!({:vid => self.vid, :tid => tid})
		end
	  end
	end
  end
end
