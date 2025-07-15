class StatusHistoriesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])

    @status_history = @project.status_histories.build(status_history_params)
    @status_history.user = User.first 

    if @status_history.save
      @project.update(status: @status_history.new_status)
      redirect_to @project, notice: "Gains being made!"
    else
      redirect_to @project, alert: "Your gains failed"
    end
  end 

  private

  def status_history_params
    params.require(:status_history).permit(:previous_status, :new_status)
  end

end 