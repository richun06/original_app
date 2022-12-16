class CareUsersController < ApplicationController

  def index
    # @care_users = CareUser.all
    if current_user.admin == true
      @care_users = CareUser.all
    else
      @care_users = CareUser.where(user_id: current_user.id)
    end

    if params[:search]
      @care_users = @care_users.name_search(params[:search][:name]).division_search(params[:search][:division])
        .sex_search(params[:search][:sex]).availability_search(params[:search][:availability])
    end
  end

  def new
    @care_user = CareUser.new
  end

  def create
    @care_user = CareUser.new(care_user_params)
    if @care_user.save
      redirect_to care_users_path, notice: "利用者登録完了！"
    else
      render :new
    end
  end

  def show
    @care_user = CareUser.find(params[:id])
  end

  def edit
    @care_user = CareUser.find(params[:id])
  end

  def update
    @care_user = CareUser.find(params[:id])
    if @care_user.update(care_user_params)
      redirect_to care_users_path, notice: "編集完了！"
    else
      render :edit
    end
  end

  def destroy
    @care_user = CareUser.find(params[:id])
    @care_user.destroy
    redirect_to care_users_path, notice: "削除完了"
  end

  private

  def care_user_params
    params.require(:care_user).permit(:name, :birthday, :age, :sex, :availability, :division, :image, :user_id, :image_cache).merge(division: params[:care_user][:division].to_i)
  end

end
