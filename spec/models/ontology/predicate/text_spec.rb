require 'spec_helper'

describe Ontology::Predicate::Text do

	describe 'format' do
		
		before :each do
			@text = Factory(:text)
			@property = Factory(:property)
			@property.predicate = @text
		end
		
		it "should return the property value as a String" do
			@property.predicate.should be_a_kind_of Ontology::Predicate::Text
			@property.value = '123'
			@property.formatted_value.should eq('123')
			@property.formatted_value.should be_a_kind_of String			
		end
				
	end		

end
