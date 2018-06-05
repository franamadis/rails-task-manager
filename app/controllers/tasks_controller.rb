class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
    end

    def edit
        @task = Task.find(params[:id])
      end
    
      def create
        @task = Task.new(task_params)
        @task.save
        # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to task_path(@task)
     end

      def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to task_path(@task)
     end

      def task_params
        # *Strong params*: You need to *whitelist* what can be updated by the user
        # Never trust user data!
        params.require(:task).permit(:title, :details, :completed)

    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
    
        # no need for app/views/task/destroy.html.erb
        redirect_to tasks_path
      end
end