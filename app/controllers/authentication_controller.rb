class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    current_user = User.find_by_email(params[:email])
    if command.success?
      render json: {
       userId: current_user.id,
       token: command.result,
       userData:  {
       user_email: current_user.email,
       username: current_user.name,
       user_phone: current_user.phone,
       user_role: current_user.role }
       }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
 
 end
 