module Ontology
  class Predicate < ActiveRecord::Base

    has_and_belongs_to_many :components, :join_table => "ontology_predicates_components"
    has_many :properties

    before_save :adjust_counters
    
    validates :name, :presence => true
    validates :type, :presence => true
    
    
    
    private
    class << self
      def components_for_select
        [['Text', 'Text'], ['Number', 'Number'], ['Currency', 'Currency']]
      end

    end

    def adjust_counters
      self.components_count = self.components.length
    end

  end
end