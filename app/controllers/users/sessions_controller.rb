# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      if resource.persisted?
        flash[:notice] = "ログインが完了しました"
      else
        flash[:alert] = "ログインに失敗しました"
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do |resource|
      flash[:notice] = "ログアウトしました"
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # サインイン後の遷移先
  def after_sign_in_path_for(resource)
    root_path
  end

  # サインアウト後の遷移先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
