class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [
  #     :name,
  #     :postcode,
  #     :prefecture_code,
  #     :address_city,
  #     :address_street,
  #     :address_building,
  #     :birthday,
  #     :phone_number
  #   ]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  # end

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :owner_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end
