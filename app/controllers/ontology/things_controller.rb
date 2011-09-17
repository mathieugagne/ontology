module Ontology
	class ThingsController < ApplicationController

		before_filter :get_dependencies
		def index
			@things = Thing.all
		end

		def show
			@thing = Thing.find(params[:id])
			render :edit
		end

		def new
			@thing = Thing.new(params[:thing])
		end

		def edit
			@thing = Thing.find(params[:id])
			rescue => ex
				respond_to do |format|
					format.html { redirect_to things_path, :alert => ex.message }
					format.xml  { head :not_found }
				end
		end

		def create
			@thing = Thing.new(params[:thing])

			respond_to do |format|
				if @thing.save
					format.html { redirect_to edit_thing_path(@thing), :notice => t(:successfully_created) }
					format.xml  { render :xml => @thing, :status => :created, :location => @thing }
				else
					format.html { render :action => "new" }
					format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
				end
			end
		end

		def update
			begin
				@thing = Thing.find(params[:id])

				respond_to do |format|
					if @thing.update_attributes(params[:thing])
						format.html { redirect_to edit_thing_path(@thing), :notice => t(:successfully_updated) }
						format.xml  { head :ok }
					else
						format.html { render :action => "edit" }
						format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
					end
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to things_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end

			end
		end

		def destroy
			begin
				@thing = Thing.find(params[:id])
				@thing.destroy

				respond_to do |format|
					format.html { redirect_to(things_url, :notice => t(:successfully_deleted)) }
					format.xml  { head :ok }
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to things_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end
			end
		end

		private

		def get_dependencies
		end

	end
end