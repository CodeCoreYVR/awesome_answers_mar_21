require 'rails_helper'
# rails generate rspec:controller job_posts --controller-specs --no-request-specs
# Use this command with above given flags to get rspec file for controller else you will get rspect file for the 'request'
RSpec.describe JobPostsController, type: :controller do
    # Testing CRUD actions for controller
    # new
    # create
    # edit
    # update
    # destroy
    # index
    # show 

    describe "#new" do
        it "renders the new template " do
            #Given
            # User requesting to show the form / There is nothing in given
            # When
            get(:new) # 👈🏻 we have this get method from rails-controller-testing gem, which made magically by this get mthod else we have to create manually
            # https://rspec.info/documentation/4.0/rspec-rails/RSpec/Rails/Matchers/RoutingMatchers/RouteHelpers.html#get-instance_method
            # Then
            expect(response).to(render_template(:new))# 👈🏻 We verify that the seponse will render out the template called "new" using the matcher 'render_template'
            # response is an object that represents the HTTP-Response
            # Rspec makes this available within the specs
        end
        it "sets an instance variable with a new job post" do
            #given
            # when
            get(:new)
            # then
            # assigns(:job_post) : we have this 'assign' method available form the 'rails-controller-testing' gen that allows you to grab an instance varaible, it takes symbol(:job_posts)
            expect(assigns(:job_post)).to(be_a_new(JobPost))
            # we check that the instance variable @job_post is a new instance of the class JobPost(Model) - the madel that we created in the last class 
        end
    end
    

end
