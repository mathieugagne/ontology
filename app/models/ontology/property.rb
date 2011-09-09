module Ontology
  class Property < ActiveRecord::Base

    belongs_to :predicate, :counter_cache => true
    belongs_to :type, :counter_cache => true

  end
end