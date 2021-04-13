Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # when someone visits GET localhost:3000/ it will be handled by "WelcomeController" index Method

  #  (HTTP VERB):GET  -- (URL): '/'👈🏻 Root Route
  get '/', to: 'welcome#index', as: 'root'
  #'welcome#index'👉🏻 CONTROLER: 'welcome' ACTION:'index'
  get '/contacts/new',to: 'contacts#new', as: 'contacts_new'
  post '/contacts', to: 'contacts#create'


end
