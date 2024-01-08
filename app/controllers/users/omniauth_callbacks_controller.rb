# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"], cookies[:referral])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?

      cookies.signed[:user] = { value: @user.id, expires: 1.year.from_now, httponly: true }
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except('extra')
      redirect_to new_user_session_url
    end
  end

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"], cookies[:referral])
    sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
    cookies.signed[:user] = { value: @user.id, expires: 1.year.from_now, httponly: true }
  end

  def failure
    redirect_to root_path
  end
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
