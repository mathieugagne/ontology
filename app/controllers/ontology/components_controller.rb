module Ontology
	class ComponentsController < ApplicationController

		def index
			@components = Component.all
		end

		def show
			@component = Component.find(params[:id])
			render :edit
		end

		def new
			@component = Component.new(params[:component])
		end

		def edit
			@component = Component.find(params[:id])
			rescue => ex
				respond_to do |format|
					format.html { redirect_to components_path, :alert => ex.message }
					format.xml  { head :not_found }
				end
		end

		def create
			@component = Component.new(params[:component])

			respond_to do |format|
				if @component.save
					format.html { redirect_to edit_component_path(@component), :notice => t(:successfully_created) }
					format.xml  { render :xml => @component, :status => :created, :location => @component }
				else
					format.html { render :action => "new" }
					format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
				end
			end
		end

		def update
			begin
				@component = Component.find(params[:id])

				respond_to do |format|
					if @component.update_attributes(params[:component])
						format.html { redirect_to edit_component_path(@component), :notice => t(:successfully_updated) }
						format.xml  { head :ok }
					else
						format.html { render :action => "edit" }
						format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
					end
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to components_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end

			end
		end

		def destroy
			begin
				@component = Component.find(params[:id])
				@component.destroy

				respond_to do |format|
					format.html { redirect_to(components_url, :notice => t(:successfully_deleted)) }
					format.xml  { head :ok }
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to components_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end
			end
		end

	end
end