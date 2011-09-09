Ontology::Engine.routes.draw do
  resources :types
  resources :things
  resources :predicates
  resources :properties
  
  root :to => "home#index"

end
