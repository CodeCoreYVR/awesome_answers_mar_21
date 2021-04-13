Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #  (HTTP VERB):GET  -- (URL): '/'👈🏻 Root Route
  get('/', {to: 'welcome#index'})
  #'welcome#index'👉🏻 CONTROLER: 'welcome' ACTION:'index'


end
