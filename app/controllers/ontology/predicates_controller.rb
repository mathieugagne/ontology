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
			rescue => ex
				respond_to do |format|
					format.html { redirect_to predicates_path, :alert => ex.message }
					format.xml  { head :not_found }
				end
		end

		def create
			@predicate = Predicate.new(params[:predicate])

			respond_to do |format|
				if @predicate.save
					format.html { redirect_to edit_predicate_path(@predicate), :notice => 'Predicate was successfully created' }
					format.xml  { render :xml => @predicate, :status => :created, :location => @predicate }
				else
					format.html { render :action => "new" }
					format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
				end
			end
		end

		def update
			begin
				@predicate = Predicate.find(params[:id])

				respond_to do |format|
					if @predicate.update_attributes(params[:predicate])
						format.html { redirect_to edit_predicate_path(@predicate), :notice => 'Predicate was successfully updated' }
						format.xml  { head :ok }
					else
						format.html { render :action => "edit" }
						format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
					end
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to predicates_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end

			end
		end

		def destroy
			begin
				@predicate = Predicate.find(params[:id])
				@predicate.destroy

				respond_to do |format|
					format.html { redirect_to(predicates_url, :notice => 'Predicate was successfully deleted') }
					format.xml  { head :ok }
				end

			rescue => ex
				respond_to do |format|
					format.html { redirect_to predicates_path, :alert => ex.message }
					format.xml  { head :unprocessable_entity }
				end
			end
		end

		private

		def get_dependencies
		end

	end
end