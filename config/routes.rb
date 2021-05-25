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
    resources :likes, shallow: true, only: [:create, :destroy]
    #shallow: true option changes PATH of the created route
    #original route without shallow true => questions/19/likes/30
    #Route with shallow true => likes/30
    get :liked, on: :collection
    #above route creates a path like: GET "/questions/liked" kind of similar to index but only questions the user has liked
  end

  resources :users, only:[:new,:create]

  resource :session, only:[:new,:create, :destroy]
  # resource is singular instead of resources, resource will create routes
  # that do CRUD operation on only one thing . There Will be no index routes and no route will have an :id wildcard.
  # the controller nae must be plural
  resources :job_posts, only:[:new, :create, :show, :index, :destroy, :edit, :update]
  match(
    "/delayed_job",
    to: DelayedJobWeb,
    anchor:false,
    via:[:get,:post]
  )
  # https://guides.rubyonrails.org/active_job_basics.html #👈🏻 Link for active jobs

  # The namespace method will use the controller found in a directory
  # called api and then in a nested directory for v1

  # defaults: { format: :json } will set "json" as the default 
  # response format for all the routes contained within the block

  # GET /api/v1/questions -> api/v1/questions#index
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create] do
        # get :current -> /api/v1/users/:user_id/current
        get :current, on: :collection # -> /api/v1/users/current
      end
    end
  end
end




