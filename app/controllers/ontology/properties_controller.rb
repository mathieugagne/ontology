module Ontology
  class PropertiesController < ApplicationController
  
    def index
      @properties = Property.all
    end

    def show
      @property = Property.find(params[:id])
      render :edit
    end

    def new
      @property = Property.new(params[:property])
    end

    def edit
      @property = Property.find(params[:id])
    end

    def create
      @property = Property.new(params[:property])

      respond_to do |format|
        if @property.save
          format.html { redirect_to(@property, :notice => t(:created, :name => @property.name)) }
          format.xml  { render :xml => @property, :status => :created, :location => @property }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @property = Property.find(params[:id])

      respond_to do |format|
        if @property.update_attributes(params[:property])
          format.html { redirect_to(@property, :notice => t(:updated, :name => @property.name)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @property = Property.find(params[:id])
      name = @property.name
      @property.destroy

      respond_to do |format|
        format.html { redirect_to(properties_url, :notice => t(:deleted, :name => name)) }
        format.xml  { head :ok }
      end
    end

  end
end