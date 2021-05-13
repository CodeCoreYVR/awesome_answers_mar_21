# config/initializers/cors.rb

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#     allow do
#         origins '127.0.0.1:5500', 'localhost:5500' # whitelist domains
#         #   you can add 'google.ca', or if you're in production, you can put your app here 
#         #   origins '*' allows everyone to access, which is probably not a good idea
#         #   resource '*', headers: :any, methods: [:get, :post, :patch, :put]
#         resource(
#             'api/*', #this only allows cors requests to a path that looks like /api
#             headers: :any, #allow requests to contain any headers
#             credentials: true, #allows us to send cookies through CORS requests
#             methods: [:get, :post, :patch, :put, :options, :delete] #options verb is being used under the hood for cors to work, make sure to have it
#         )
#     end
#   end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '127.0.0.1:5500', 'localhost:5500' # whitelist domains
      resource(
        '/api/*', # limit requests to paths that look like /api
        headers: :any, # all the requests to contain any headers
        credentials: true, # because we're sending cookies with CORS we must add this flag
        methods: [:get, :post, :patch, :put, :options, :delete] #allow these http verbs
      )
    end
end