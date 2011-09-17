require 'spec_helper'

describe Ontology::Thing do
	describe 'validations' do
		
		before :each do
			@thing = Ontology::Thing.new
		end
		
		it "should be invalid without a name" do
			@thing.should_not be_valid
			@thing.should have(1).error_on(:name)
			@thing.errors_on(:name).should == ["can't be blank"]
		end
		
		it "should be invalid without a component_id" do
			@thing.should_not be_valid
			@thing.should have(1).error_on(:component_id)
			@thing.errors_on(:component_id).should == ["can't be blank"]
		end
	end
	
	describe 'associations' do
		
		before :each do
			@thing = Factory(:thing)
		end
		
		it "should have many properties" do
			@thing.should respond_to(:properties)
			@thing.properties.should be_a_kind_of Array
			@property = Factory(:property)
			@thing.properties << @property
			@thing.properties.should eq([@property])
		end
		
		it "should belong to a component" do
			@thing.should respond_to(:component)
			@thing.component.should be_a_kind_of Ontology::Component
			@component = Factory(:component)
			@thing.component = @component
			@thing.component.should eq(@component)						
		end
		
	end
end
