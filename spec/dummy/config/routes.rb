Rails.application.routes.draw do

  mount Ontology::Engine, :at => "/ontology"
  
  match ':controller(/:action(/:id(.:format)))'
  
end
