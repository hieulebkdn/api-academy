class PasswordController < ApplicationController
  def update
    if @current_user.authenticate(params[:old_password])
      @current_user.password = params[:new_password]
      @current_user.password_confirmation = params[:new_password]
      @current_user.save!
      render json: {message: "Password change succesfully!"}, status: :updated
    else
      render json: {error: "Old password incorrect!"}, status: :unauthorized
    end
  end
end
