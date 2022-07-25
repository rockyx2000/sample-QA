# frozen_string_literal: true

class Devise::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(configure_sign_up_params)
    if @user.save
      redirect_to root_path
    else
      render "registrations/new", status: :unprocessable_entity
    end
  end

  # GET /resource/edit
  def edit
    User.new
  end

  # PUT /resource
  def update
    @user = User.find_by(id: current_user.id)
    if @user.update(update_params)
      redirect_to root_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find_by(id: current_user.id)
    @user.destroy
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def update_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
