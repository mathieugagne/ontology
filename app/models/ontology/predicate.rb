module Ontology
  class Predicate < ActiveRecord::Base

    has_and_belongs_to_many :types, :join_table => "ontology_predicates_types"
    has_many :properties

    before_save :adjust_counters

    private
    class << self
      def types_for_select
        [['Text', 'Text'], ['Number', 'Number'], ['Currency', 'Currency']]
      end

    end

    def adjust_counters
      self.types_count = self.types.length
    end

  end
end