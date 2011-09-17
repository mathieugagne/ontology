require 'spec_helper'

describe Ontology::Component do
	describe 'validations' do
		
		it "should require a name" do
			@component = Ontology::Component.create
			@component.should_not be_valid
			@component.name = 'Animal'
			@component.should be_valid
		end
		
	end
	
	describe 'associations' do
		
		before :each do
			@component = Factory(:component)
		end
		
		it "should have many ancestors" do
			@component.should respond_to(:ancestors)
			@component.ancestors.should be_a_kind_of Array
			@ancestor = Factory.stub(:component)
			@component.ancestors << @ancestor
			@component.ancestors.should eq([@ancestor])
		end
		
		it "should have many descendants" do
			@component.should respond_to(:descendants)
			@component.descendants.should be_a_kind_of Array
			@descendant = Factory.stub(:component)
			@component.descendants << @descendant
			@component.descendants.should eq([@descendant])			
		end
		
		it "should have many groups" do
			@component.should respond_to(:groups)
			@component.groups.should be_a_kind_of Array
			@group = Factory.stub(:component)
			@component.groups << @group
			@component.groups.should eq([@group])			
		end
		
		it "should have many members" do
			@component.should respond_to(:members)
			@component.members.should be_a_kind_of Array
			@member = Factory.stub(:component)
			@component.members << @member
			@component.members.should eq([@member])			
		end
		
		it "should have many predicates" do
			@component.should respond_to(:predicates)
			@component.predicates.should be_a_kind_of Array
			@predicate = Factory(:predicate)
			@component.predicates << @predicate
			@component.predicates.should eq([@predicate])			
		end
		
		it "should have many things" do
			@component.should respond_to(:things)
			@component.things.should be_a_kind_of Array
			@thing = Factory(:thing)
			@component.things << @thing
			@component.things.should eq([@thing])			
		end
		
	end
end
