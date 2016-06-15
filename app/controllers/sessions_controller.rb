class SessionsController < ApplicationController

  def create
      auth = request.env["omniauth.auth"]
    @user = User.find_by(uid: auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end
