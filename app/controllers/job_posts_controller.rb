class JobPostsController < ApplicationController
    def new
        @job_post=JobPost.new
    end
    def create
        JobPost.create params.require(:job_post)
        .permit(
            :title,
            :description,
            :min_salary,
            :max_salary,
            :location,
            :company_name
        )
    end
end
