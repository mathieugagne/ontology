require 'spec_helper'
	
describe Ontology::ComponentsController do
		
	before(:each) do
		@model = 'Ontology::Component'
	end
			
  it_should_behave_like "CRUD GET index"
	it_should_behave_like "CRUD GET show"
	it_should_behave_like "CRUD POST create"
	it_should_behave_like "CRUD PUT update"
	it_should_behave_like "CRUD DELETE destroy"
	it_should_behave_like "CRUD GET edit"

end
