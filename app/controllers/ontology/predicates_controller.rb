module Ontology
  class PredicatesController < ApplicationController
    
    before_filter :get_dependencies
  
    def index
      @predicates = Predicate.all
    end

    def show
      @predicate = Predicate.find(params[:id])
      render :edit
    end

    def new
      @predicate = Predicate.new(params[:predicate])
    end

    def edit
      @predicate = Predicate.find(params[:id])
    end

    def create
      @predicate = Predicate.new(params[:predicate])

      respond_to do |format|
        if @predicate.save
          format.html { redirect_to(@predicate, :notice => t(:created, :name => @predicate.name)) }
          format.xml  { render :xml => @predicate, :status => :created, :location => @predicate }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @predicate = Predicate.find(params[:id])

      respond_to do |format|
        if @predicate.update_attributes(params[:predicate])
          format.html { redirect_to(@predicate, :notice => t(:updated, :name => @predicate.name)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @predicate = Predicate.find(params[:id])
      name = @predicate.name
      @predicate.destroy

      respond_to do |format|
        format.html { redirect_to(predicates_url, :notice => "Successfuly deleted #{name}") }
        format.xml  { head :ok }
      end
    end
    
    private
    
    def get_dependencies
      # @predicates = Predicate.all
      # @predicates = Predicate.all
    end

  end
end