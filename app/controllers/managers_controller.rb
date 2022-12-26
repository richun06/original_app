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

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    if @manager.update(manager_params)
      redirect_to managers_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def manager_params
    params.require(:manager).permit(:name)
  end
end
