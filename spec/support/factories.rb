FactoryGirl.define do

	# VALID MODEL GENERATORS
	
	factory :component, :class => Ontology::Component do
		name 'Animal'
	end
	
	factory :thing, :class => Ontology::Thing do
		name 'Animal'
		association :component, :factory => :component
	end

	factory :property, :class => Ontology::Property do
		value '123'
		association :predicate, :factory => :predicate
		association :thing, :factory => :thing
	end
	
	factory :predicate, :class => Ontology::Predicate do
		name 'Legs'
		type 'Number'
	end
	
	factory :number, :class => Ontology::Predicate::Number do
		name 'Legs'
	end
	
	factory :text, :class => Ontology::Predicate::Text do
		name 'Description'
	end
	
	
	# INVALID MODEL GENERATORS
	
	factory :invalid_component, :class => Ontology::Component do
		whatever 'not permitted'		
	end
	factory :invalid_thing, :class => Ontology::Thing do
		whatever 'not permitted'
	end
	
	factory :invalid_predicate, :class => Ontology::Predicate do
		whatever 'not permitted'
	end
	factory :invalid_property, :class => Ontology::Property do
		whatever 'not permitted'
	end
	
end