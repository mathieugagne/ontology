require 'spec_helper'

describe Ontology::Property do
	
	describe 'validations' do
		
		before :each do
			@property = Ontology::Property.new
		end
		
		it "should be invalid without a value" do
			@property.should_not be_valid
			@property.should have(1).error_on(:value)
			@property.errors_on(:value).should == ["can't be blank"]
		end
		
		it "should be invalid without a thing_id" do
			@property.should_not be_valid
			@property.should have(1).error_on(:thing_id)
			@property.errors_on(:thing_id).should == ["can't be blank"]
		end
		
		it "should be invalid without a predicate_id" do
			@property.should_not be_valid
			@property.should have(1).error_on(:predicate_id)
			@property.errors_on(:predicate_id).should == ["can't be blank"]
		end
	end
	
	describe 'associations' do
		
		before :each do
			@property = Factory(:property)
		end
		
		it "should have one thing" do
			@property.should respond_to(:thing)
			@property.thing.should be_a_kind_of Ontology::Thing
			@thing = Factory(:thing)
			@property.thing = @thing
			@property.thing.should eq(@thing)
		end
		
		it "should have one predicate" do
			@property.should respond_to(:predicate)
			@property.predicate.should be_a_kind_of Ontology::Predicate
			@predicate = Factory(:predicate)
			@property.predicate = @predicate
			@property.predicate.should eq(@predicate)
		end
		
	end
	
	describe 'format' do
		
		before :each do
			@property = Factory(:property)
		end
		
		it 'should display value according to predicate type' do
			@property.predicate = Factory(:number)
			@property.predicate.should be_a_kind_of Ontology::Predicate::Number
			@property.value = '123'
			@property.formatted_value.should eq(123)
			@property.formatted_value.should be_a_kind_of Integer
		end		
		
	end
	
end
