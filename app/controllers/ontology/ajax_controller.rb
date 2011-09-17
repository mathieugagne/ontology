module Ontology
	class AjaxController < ApplicationController
		
		def components
			if params[:term]
				like= "%".concat(params[:term].concat("%"))
				components = Component.where("name like ?", like)
			else
				components = Component.all
			end
			list = components.map {|u| Hash[ id: u.id, label: u.name, name: u.name]}
			render json: list
		end

		def predicates
			if params[:term]
				like= "%".concat(params[:term].concat("%"))
				predicates = Predicate.where("name like ?", like)
			else
				predicates = Predicate.all
			end
			list = predicates.map {|u| Hash[ id: u.id, label: u.name, name: u.name]}
			render json: list
		end

	end

end
