module Ontology
	class PropertiesController < ApplicationController

		before_filter :get_dependencies
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
			rescue => ex
				respond_to do |format|
					format.html { redirect_to properties_path, :alert => ex.message }
					format.xml  { head :not_found }
				end
		end

		def create
			@property = Property.new(params[:property])

			respond_to do |format|
				if @property.save
					format.html { redirect_to edit_property_path(@property), :notice => 'Property was successfully created' }
					format.xml  { render :xml => @property, :status => :created, :location => @property }
				else
					format.html { render :action => "new" }
					format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
				end
			end
		end

		def update
			begin
				@property = Property.find(params[:id])

				respond_to do |format|
					if @property.update_attributes(params[:property])
						format.html { redirect_to edit_property_path(@property), :notice => 'Property was successfully updated' }
						format.xml  { head :ok }
					else
						format.html { render :action => "edit" }
						format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
					end
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to properties_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end

			end
		end

		def destroy
			begin
				@property = Property.find(params[:id])
				@property.destroy

				respond_to do |format|
					format.html { redirect_to(properties_url, :notice => 'Property was successfully deleted') }
					format.xml  { head :ok }
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to properties_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end
			end
		end

		private

		def get_dependencies
		end

	end
end