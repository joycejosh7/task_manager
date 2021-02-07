class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_task_creator, only: [:edit, :update]

    def index
        if params[:project_id] && @project = Project.find_by_id(params[:post_id])
            @tasks = @project.tasks
        else  
            @error = "That project doesn't exist" if params[:project_id]
            @tasks = Task.all
        end
    end

    def new
        #if it's nested and why find the post
        if params[:project_id] && @project = Project.find_by_id(params[:project_id])
            @task = @project.tasks.build
        else  
            @error = "That project doesn't exist" if params[:project_id]
            @task = Task.new
        end
    end

    def create
        @task = current_user.tasks.build(task_params)
            if @task.save
                redirect_to tasks_path
            else  
                render :new
            end
    end


end
