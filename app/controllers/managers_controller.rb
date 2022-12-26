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
      redirect_to managers_path, notice: "管理者名を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy
    redirect_to managers_path, notice: "管理者を削除しました"
  end

  private

  def manager_params
    params.require(:manager).permit(:name)
  end
end
