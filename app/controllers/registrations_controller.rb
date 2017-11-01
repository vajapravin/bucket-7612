class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
  rescue Exception => e
    flash.now[:error] = e.message
    render '/shared/_signup.haml'
  end

  def verify
    @user = User.find_by(confirmation_token: params[:user][:confirmation_token])
    if @user
      @user.self_confirm
      sign_in(@user)
      redirect_to '/'
    else
      flash.now[:error] = 'Code does not match! Please try again.'
      render '/registrations/create.haml'
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end