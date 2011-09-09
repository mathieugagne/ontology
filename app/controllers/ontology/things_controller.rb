module Ontology
  class ThingsController < ApplicationController
    
    before_filter :get_dependencies
  
    def index
      @things = Thing.all
    end

    def show
      edit
      render :edit
    end

    def new
      @thing = Thing.new(params[:thing])
    end

    def edit
      @thing = Thing.find(params[:id])
    end

    def create
      @thing = Thing.new(params[:thing])

      respond_to do |format|
        if @thing.save
          format.html { redirect_to @thing, :notice => t(:created, :name => @thing.name) }
          format.xml  { render :xml => @thing, :status => :created, :location => @thing }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @thing = Thing.find(params[:id])

      respond_to do |format|
        if @thing.update_attributes(params[:thing])
          format.html { redirect_to(@thing, :notice => t(:updated, :name => @thing.name)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @thing = Thing.find(params[:id])
      name = @thing.name
      @thing.destroy

      respond_to do |format|
        format.html { redirect_to(things_url, :notice => t(:deleted, :name => name)) }
        format.xml  { head :ok }
      end
    end
    
    private
    
    def get_dependencies
      @types = Type.all
      # @predicates = Predicate.all      
    end

  end
end