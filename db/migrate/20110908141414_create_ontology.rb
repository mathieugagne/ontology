class CreateOntology < ActiveRecord::Migration
  
  def self.up
    
    create_table :ontology_things, :force => true do |t|
      t.integer :component_id
      t.string  :name
      t.integer :properties_count, :default => 0
    end
    add_index :ontology_things, :properties_count
    
    create_table :ontology_components, :force => true do |t|
      t.string  :name
      t.string  :description
      t.boolean :abstract, :default => false
      t.integer :things_count, :default => 0
      t.integer :predicates_count, :default => 0
      t.integer :members_count, :default => 0
      t.integer :groups_count, :default => 0
      t.integer :ancestors_count, :default => 0
      t.integer :descendants_count, :default => 0
    end
    add_index :ontology_components, :things_count
    add_index :ontology_components, :predicates_count
    add_index :ontology_components, :members_count
    add_index :ontology_components, :groups_count
    add_index :ontology_components, :ancestors_count
    add_index :ontology_components, :descendants_count
    
    create_table :ontology_predicates, :force => true do |t|
      t.string  :name
      t.string  :component
      t.string 	:type
      t.integer :properties_count, :default => 0
      t.integer :components_count, :default => 0
    end
    add_index :ontology_predicates, :properties_count
    add_index :ontology_predicates, :components_count
    
    create_table :ontology_properties, :force => true do |t|
      t.integer  :predicate_id
      t.integer  :thing_id
      t.string   :value
    end
    
    create_table :ontology_relations, :id => false, :force => true do |t|
      t.integer :ancestor_id
      t.integer :descendant_id
    end
        
    create_table :ontology_belongings, :id => false, :force => true do |t|
      t.integer :member_id
      t.integer :group_id
    end
    
    create_table :ontology_predicates_components, :id => false, :force => true do |t|
      t.integer :predicate_id
      t.integer :component_id
    end
    
    # Create the first component to master them all
    Ontology::Component.create(:name => "Everything")
    
  end
  
  def self.down
    drop_table :ontology_things
    drop_table :ontology_components
    drop_table :ontology_properties
    drop_table :ontology_predicates
    drop_table :ontology_relations
    drop_table :ontology_belongings
  end
  
end
