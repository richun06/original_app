class ManagersController < ApplicationController

  def new
    @manager = Manager.new
  end

  def create
    if current_user.owner_id != nil
      @manager = Manager.new(manager_params)
      @manager.user_id = current_user.id
      if @manager.save
        redirect_to managers_path
      else
        render :new
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  def index
    if current_user.owner_id != nil
      @managers = Manager.all
    else
      redirect_to user_path(current_user.id)
    end
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
    params.require(:manager).permit(:name, :user_id)
  end
end
