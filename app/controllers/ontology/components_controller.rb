module Ontology
  class TypesController < ApplicationController
    
    before_filter :get_dependencies
  
    def index
      @types = Type.all
    end

    def show
      @type = Type.find(params[:id])
      render :edit
    end

    def new
      @type = Type.new(params[:type])
    end

    def edit
      @type = Type.find(params[:id])
    end

    def create
      @type = Type.new(params[:type])

      respond_to do |format|
        if @type.save
          format.html { redirect_to(@type, :notice => t(:created, :name => @type.name)) }
          format.xml  { render :xml => @type, :status => :created, :location => @type }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @type = Type.find(params[:id])

      respond_to do |format|
        if @type.update_attributes(params[:type])
          format.html { redirect_to(@type, :notice => t(:updated, :name => @type.name)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @type = Type.find(params[:id])
      name = @type.name
      @type.destroy

      respond_to do |format|
        format.html { redirect_to(types_url, :notice => t(:deleted, :name => name)) }
        format.xml  { head :ok }
      end
    end
    
    private
    
    def get_dependencies
      @types = Type.all
      @predicates = Predicate.all      
    end

  end
end