class HealthsController < ApplicationController
  def new
    # byebug
    @health = Health.new
    @care_user = CareUser.find(params[:care_user_id])
    # @care_user = params[:care_user_id]
    # byebug
  end

  def create
    @health = Health.new(health_params)
    # @health = @care_user.health.build(params[:id])
    # @health.care_user_id = @care_user.id
    # @care_user = @health.build_care_user(care_user_params)
    # binding.pry
    if current_user.owner_id != nil
      if @health.save
        redirect_to healths_path(health_params), notice: "登録完了！"
      else
        # redirect_to new_health_path(care_user_id: care_user_id)
        render :new
      end
    end
  end

  def index
    # binding.pry
    if current_user.owner_id != nil
      @healths = Health.where(care_user_id: params[:care_user_id])
      @care_user = CareUser.find(params[:care_user_id])
      # @comments = @health.comments
    else
      @healths = Health.where(care_user_id: current_user.care_users.ids)
      @care_users = CareUser.find(current_user.care_users.ids)
      @care_user = CareUser.find(params[:care_user_id])
      # @comments = Comment.find(params[:comment_id])
    end
    # @healths = care_user.healths
  end

  def show
    @health = Health.find(params[:id])
    # @comments = @health.comments
    # @comment = @health.comments.build
  end

  def edit
    @health = Health.find(params[:id])
    @care_user = CareUser.find(@health.care_user_id)
  end

  def update
    @health = Health.find(params[:id])
    @care_user = CareUser.find(@health.care_user_id)
    if @health.update(health_params)
      # @care_user = CareUser.find(@health.care_user_id)
      # redirect_to healths_path, notice: "編集完了！"
      redirect_to controller: :healths, action: :index, care_user_id: @health.care_user_id
    else
      render :edit
    end
  end

  def destroy
    @health = Health.find(params[:id])
    @health.destroy
    # redirect_to healths_path, notice: "削除完了"
    redirect_to controller: :healths, action: :index, care_user_id: @health.care_user_id
  end

  private

  def health_params
    params.require(:health).permit(:record_in_at, :time, :blood_pressure_up, :blood_pressure_down, :pulse, :body_temperature, :breakfast, :lunch, :snack, :dinner, :before_sleep, :morning_medicine, :daytime_medicine, :snack_medicine, :evening_medicine, :sleep_medicine, :bath_time, :bath_division, :caregiver, :height, :body_weight, :daytime, :daytime_staff, :night, :night_staff, :contact, :contact_staff, :responsibility, :transfer, :care_user_id)
    # .merge(breakfast: params[:health][:breakfast].to_i, lunch: params[:health][:lunch].to_i, snack: params[:health][:snack].to_i, dinner: params[:health][:dinner].to_i, before_sleep: params[:health][:before_sleep].to_i, morning_medicine: params[:health][:morning_medicine].to_i, daytime_medicine: params[:health][:daytime_medicine].to_i, snack_medicine: params[:health][:snack_medicine].to_i, evening_medicine: params[:health][:evening_medicine].to_i, sleep_medicine: params[:health][:sleep_medicine].to_i, bath_division: params[:health][:bath_division].to_i)
  end

end
