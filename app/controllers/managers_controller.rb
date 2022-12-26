class ManagersController < ApplicationController

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      redirect_to managers_path
    else
      render :new
    end
  end

  def index
    @managers = Manager.all
  end

  private

  def manager_params
    params.require(:manager).permit(:name)
  end
end
