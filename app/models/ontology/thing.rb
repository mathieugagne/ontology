module Ontology
  class Thing < ActiveRecord::Base

    belongs_to :component, :counter_cache => true
    has_many :properties

    accepts_nested_attributes_for :properties
    
    validates :name, :presence => true
    validates :component_id, :presence => true

    before_create :create_properties

    private
    def create_properties
      self.component.predicates.each do |predicate|
        property = Property.create()
        self.properties << property
        Predicate.find(predicate.id).properties << property
      end
    end

  end
end