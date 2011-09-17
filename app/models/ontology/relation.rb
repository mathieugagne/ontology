module Ontology
  class Relation < ActiveRecord::Base

    belongs_to :ancestor, :class_name => 'Component'
    belongs_to :descendant, :class_name => 'Component'

  end
end