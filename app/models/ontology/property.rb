module Ontology
  class Property < ActiveRecord::Base

    belongs_to :predicate, :counter_cache => true
    belongs_to :thing, :counter_cache => true
    
    validates :value, :presence => true
    validates :predicate_id, :presence => true
    validates :thing_id, :presence => true
    
    def formatted_value
    	self.predicate.format(value)
    end

  end
end