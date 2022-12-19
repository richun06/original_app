class UsersController < ApplicationController
  def show
    # binding.pry
    @user = current_user
    @care_users = @user.care_users
  end

  # def new
  #   @user = User.new
  #   @care_users = CareUser.where(user_id: nil) #ケアユーザの中にユーザが入っていない人を探してくる
  # end

end
