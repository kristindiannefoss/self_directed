class SessionsController < ApplicationController

  def create
    raise request.env["omniauth.auth"].to_yaml
  end

  
  # def create
  #   @user = User.find_by(id: auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
  #   if @user
  #        session[:user_id] = @user.id
  #        redirect_to user_path(current_user)
  #   else
  #        redirect_to root_url
  #   end
  # end

  def destroy
    reset_session
    redirect_to root_url
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end
