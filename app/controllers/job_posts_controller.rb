class JobPostsController < ApplicationController
    before_action :authenticate_user!, except:[:index,:show]
    def new
        @job_post=JobPost.new
    end
    def create
        @job_post=JobPost.new params.require(:job_post)
        .permit(
            :title,
            :description,
            :min_salary,
            :max_salary,
            :location,
            :company_name
        )
        @job_post.user= current_user
        if @job_post.save
            redirect_to job_post_path(@job_post)
        else
            render :new
        end
    end
    def show
        @job_post=JobPost.find params[:id]
    end
    def index
        @job_posts=JobPost.all.order(created_at: :desc)
    end
    def destroy
        
        job_post= JobPost.find params[:id]
        if can?(:delete, job_post)
            job_post.destroy
            flash[:danger]='Deleted job post'
            redirect_to job_posts_path
        end
    end
    def edit
        job_post= JobPost.find params[:id]
        if can?(:edit,job_post)
            render :edit
        else
            redirect_to job_post_path(job_post)
        end
    end
    def update
        @job_post=JobPost.find params[:id]
        if @job_post.update params.require(:job_post).permit(
            :title,
            :description,
            :min_salary,
            :max_salary,
            :location,
            :company_name
        )   
        redirect_to @job_post        
        end

    end
end
