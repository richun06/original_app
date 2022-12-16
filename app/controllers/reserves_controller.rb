class ReservesController < ApplicationController

  def index
    if current_user.admin == true
      @reserves = Reserve.all
      @reserve = Reserve.new
    else
      @reserves = Reserve.where(user_id: current_user.id)
      @reserve = Reserve.new
      # @care_users = CareUser.find(current_user.care_users.ids)
    end
  end

  def new
    @reserve = Reserve.new
  end

  def create
    # Reserve.create(reserve_parameter)
    @reserve = Reserve.new(reserve_parameter)
    @reserve.user_id = current_user.id
    if @reserve.save
      redirect_to reserves_path, notice: "登録完了！"
      return
    end
  end

  def show
    @reserve = Reserve.find(params[:id])
    # @care_users = CareUser.find(current_user.care_users.ids)
    # @care_user = CareUser.find(params[:care_user_id])
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    redirect_to reserves_path, notice:"削除しました"
  end

  def edit
    @reserve = Reserve.find(params[:id])
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update(reserve_parameter)
      redirect_to reserves_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def reserve_parameter
    params.require(:reserve).permit(:title, :content, :start_time, :user_id)
  end

end
