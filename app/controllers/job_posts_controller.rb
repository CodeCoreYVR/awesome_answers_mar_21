class JobPostsController < ApplicationController
    def new
        @job_post=JobPost.new
    end
end
