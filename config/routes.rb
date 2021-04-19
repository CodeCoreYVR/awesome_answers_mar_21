Rails.application.routes.draw do
  get 'answers/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # when someone visits GET localhost:3000/ it will be handled by "WelcomeController" index Method

  #  (HTTP VERB):GET  -- (URL): '/'👈🏻 Root Route
  get '/', to: 'welcome#index', as: 'root'
  #'welcome#index'👉🏻 CONTROLER: 'welcome' ACTION:'index'
  get '/contacts/new', to: 'contacts#new', as: 'contacts_new'
  post '/contacts', to: 'contacts#create'

  #RESTful Routes for Questions resource
  #1. index: GET "/<resources>" - return all records of that resource
  #GET "/questions" - return all questions in database
  #2. new: GET "/<resources>/new" - return a view with a form to create a resource
  # GET "/questions/new" - A form to create a new question
  #3. create: POST "/<resources>" - handle the submission to the "new form"
  #POST "/questions" - insert a new question into the database
  #4. show: GET "/<resources>/:id" - return one record of that resource
  #GET "/questions/1" - return the show page for question with id of 1
  #5. edit: GET "/<resources>/:id/edit" - returns a view form to update an existing resource
  #GET "/questions/1/edit" - return a form to edit the question with id 1
  #6. update: PATCH "/<resources>/:id" - handle the submission of the "edit form"
  #PATCH "/questions/1" - update the question with id of 1
  #7. destroy: DELETE "/<resources>/:id" - delete a record from the database
  #DELETE "/questions/1" - delete the question with id 1

  # #new
  # get('/questions/new', { to: 'questions#new', as: :new_question })

  # #create
  # post('/questions', { to: 'questions#create', as: :questions})

  # #index
  # get('/questions', { to: 'questions#index' })

  # #show
  # get('/questions/:id', { to: 'questions#show', as: :question } )

  # #edit
  # get('/questions/:id/edit', { to: 'questions#edit', as: :edit_question })

  # #update
  # patch('/questions/:id', { to: 'questions#update' })

  # #destroy
  # delete('/questions/:id', { to: 'questions#destroy' })

  #resources builds all of the above RESTful routes to Rails Convention
  resources :questions do
    resources :answers, only:[:create, :destroy]
  end


end
