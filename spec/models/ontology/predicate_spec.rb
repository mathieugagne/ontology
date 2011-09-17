require 'spec_helper'

describe Ontology::Predicate do
	
	describe 'validations' do
		
		before :each do
			@predicate = Ontology::Predicate.new
		end
		
		it "should be invalid without a name" do
			@predicate.should_not be_valid
			@predicate.should have(1).error_on(:name)
			@predicate.errors_on(:name).should == ["can't be blank"]
		end
		
		it "should be invalid without a type" do
			@predicate.should_not be_valid
			@predicate.should have(1).error_on(:type)
			@predicate.errors_on(:type).should == ["can't be blank"]
		end
		
	end
	
	describe 'associations' do
		
		before :each do
			@predicate = Factory(:predicate)
		end
		
		it "should have many components" do
			@predicate.should respond_to(:components)
			@predicate.components.should be_a_kind_of Array
			@component = Factory(:component)
			@predicate.components << @component
			@predicate.components.should eq([@component])
		end
				
	end
end
