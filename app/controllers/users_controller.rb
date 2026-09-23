class UsersController < ApplicationController
  def show
    @user = current_user
  end

  # プロフィール
  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user

    if @user.update(user_params)
      redirect_to users_profile_path
    else
      render :profile_edit, status: :unprocessable_entity
    end
  end

  # アカウント
  def account
    @user = current_user
  end

  def account_edit
    @user = current_user
  end

  def account_update
    @user = current_user

    if @user.update_with_password(user_params)
      redirect_to users_account_path
    else
      render :account_edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :image,
      :introduction,
      :email,
      :password,
      :current_password,
      :password_confirmation
    )
  end
end