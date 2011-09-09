module Ontology
  class Relation < ActiveRecord::Base

    belongs_to :ancestor, :class_name => 'Type'
    belongs_to :descendant, :class_name => 'Type'

  end
end