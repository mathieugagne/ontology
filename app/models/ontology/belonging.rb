module Ontology
  class Belonging < ActiveRecord::Base

    belongs_to :group, :class_name => 'Component'
    belongs_to :member, :class_name => 'Component'

  end
end