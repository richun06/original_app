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
    @managers = Manager.where(user_id: current_user.id)
    # @managers = Manager.all
  end

  def edit
    @manager = Manager.find(params[:id])
    if @manager.user_id == current_user.id
      render "edit"
    else
      redirect_to managers_path
    end
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
    if @manager.user_id == current_user.id
      @manager.destroy
      redirect_to managers_path, notice: "管理者を削除しました"
    else
      redirect_to managers_path
    end
  end

  private

  def manager_params
    params.require(:manager).permit(:name, :user_id)
  end
end
