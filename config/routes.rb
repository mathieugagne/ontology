Ontology::Engine.routes.draw do
	
  get "ajax/types"

  get "ajax/predicates"

  resources :components
  resources :things
  resources :predicates
  resources :properties
  
  root :to => "home#index"

end
