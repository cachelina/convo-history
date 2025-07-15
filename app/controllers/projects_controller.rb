class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    puts "projects = #{@projects}"
  end 

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.order(:created_at)
    @status_histories = @project.status_histories.order(:created_at)
    @history = (@comments + @status_histories).sort_by(&:created_at)
  end 


end 