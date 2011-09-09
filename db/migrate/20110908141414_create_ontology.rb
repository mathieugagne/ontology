class CreateOntology < ActiveRecord::Migration
  
  def self.up
    
    create_table :ontology_things, :force => true do |t|
      t.integer :type_id
      t.string  :name
      t.integer :properties_count, :default => 0
    end
    add_index :ontology_things, :properties_count
    
    create_table :ontology_types, :force => true do |t|
      t.string  :name
      t.string  :description
      t.integer :things_count, :default => 0
      t.integer :predicates_count, :default => 0
      t.boolean :abstract, :default => false
    end
    add_index :ontology_types, :things_count
    add_index :ontology_types, :predicates_count
    
    create_table :ontology_predicates, :force => true do |t|
      t.string  :name
      t.string  :type
      t.integer :properties_count, :default => 0
      t.integer :types_count, :default => 0
    end
    add_index :ontology_predicates, :properties_count
    add_index :ontology_predicates, :types_count
    
    create_table :ontology_properties, :force => true do |t|
      t.integer  :predicate_id
      t.integer  :thing_id
      t.string   :value
    end
    
    create_table :ontology_relations, :id => false, :force => true do |t|
      t.integer :ancestor_id
      t.integer :descendant_id
    end
    
    create_table :ontology_predicates_types, :id => false, :force => true do |t|
      t.integer :predicate_id
      t.integer :type_id
    end
    
    
    # Create the first type to master them all
    Ontology::Type.create(:name => "Everything")
    
  end
  
  def self.down
    drop_table :ontology_things
    drop_table :ontology_types
    drop_table :ontology_properties
    drop_table :ontology_predicates
    drop_table :ontology_relations
  end
  
end
