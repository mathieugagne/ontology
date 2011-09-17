module Ontology
  class Type < ActiveRecord::Base

    EVERYTHING_TYPE_ID= 1

    has_many :things
    has_and_belongs_to_many :predicates, :join_table => "ontology_predicates_types"

    has_many :relations, :foreign_key => :ancestor_id
    has_many :reverse_relations, :class_name => 'Relation', :foreign_key => :descendant_id

    has_many :descendants,
           :through => :relations,
           :source => 'descendant'

    has_many :ancestors,
           :through => :reverse_relations,
           :source => 'ancestor'
           
    has_many :belongings, :foreign_key => :member_id
    has_many :reverse_belongings, :class_name => 'Belonging', :foreign_key => :group_id

    has_many :members,
           :through => :reverse_belongings,
           :source => 'member'

    has_many :groups,
           :through => :belongings,
           :source => 'group'

    validates :name, :presence => true

    before_save :adjust_counters
    class << self
      def everything
        find(EVERYTHING_TYPE_ID)
      end

    end

    private

    def adjust_counters
      self.predicates_count = self.predicates.length
      self.members_count = self.members.length
      self.groups_count = self.groups.length
      self.descendants_count = self.descendants.length
      self.ancestors_count = self.ancestors.length
    end

  end
end