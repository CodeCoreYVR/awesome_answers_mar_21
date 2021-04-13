# Command to generate this controller is as follows:
# rails generate controller welcome 
# Following files were generated when agove controller geration command was executed
# Running via Spring preloader in process 61359
#       create  app/controllers/welcome_controller.rb
#       invoke  erb
#       create    app/views/welcome
#       invoke  helper
#       create    app/helpers/welcome_helper.rb
#       invoke  assets
#       invoke    scss
#       create      app/assets/stylesheets/welcome.scss
class WelcomeController < ApplicationController
    def index
        # By default rails will render a template within
        # a folder hhat has controller name 
        # using the file that mathces the action
        # By default it will render /views/welcome/index.html
        # But if we wnat to render some other page we can do this as well : render '<path to view>'
        # Some examples of templating langauges are HAML, SLIM

        render 'hello'
    end
end
