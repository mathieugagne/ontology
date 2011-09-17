require 'spec_helper'

describe Ontology::Predicate::Number do

	describe 'format' do
		
		before :each do
			@number = Factory(:number)
			@property = Factory(:property)
			@property.predicate = @number
		end
		
		it "should return the property value as an Integer" do
			@property.predicate.should be_a_kind_of Ontology::Predicate::Number
			@property.value = '123'
			@property.formatted_value.should eq(123)
			@property.formatted_value.should be_a_kind_of Integer			
		end
				
	end		

end
