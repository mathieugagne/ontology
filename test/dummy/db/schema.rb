# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110908141414) do

  create_table "ontology_predicates", :force => true do |t|
    t.string  "name"
    t.string  "type"
    t.integer "properties_count", :default => 0
    t.integer "types_count",      :default => 0
  end

  add_index "ontology_predicates", ["properties_count"], :name => "index_ontology_predicates_on_properties_count"
  add_index "ontology_predicates", ["types_count"], :name => "index_ontology_predicates_on_types_count"

  create_table "ontology_predicates_types", :id => false, :force => true do |t|
    t.integer "predicate_id"
    t.integer "type_id"
  end

  create_table "ontology_properties", :force => true do |t|
    t.integer "predicate_id"
    t.integer "thing_id"
    t.string  "value"
  end

  create_table "ontology_relations", :id => false, :force => true do |t|
    t.integer "ancestor_id"
    t.integer "descendant_id"
  end

  create_table "ontology_things", :force => true do |t|
    t.integer "type_id"
    t.string  "name"
    t.integer "properties_count", :default => 0
  end

  add_index "ontology_things", ["properties_count"], :name => "index_ontology_things_on_properties_count"

  create_table "ontology_types", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "things_count",     :default => 0
    t.integer "predicates_count", :default => 0
    t.boolean "abstract",         :default => false
  end

  add_index "ontology_types", ["predicates_count"], :name => "index_ontology_types_on_predicates_count"
  add_index "ontology_types", ["things_count"], :name => "index_ontology_types_on_things_count"

end
