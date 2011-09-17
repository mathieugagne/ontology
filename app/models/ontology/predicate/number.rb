module Ontology	
	class Predicate::Number < Predicate
		
		def format value
			value.to_i
		end
		
	end
end