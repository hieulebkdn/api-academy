class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def authorize_admin
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: "You don't have permission to perform this action" }, 
      status: 401 unless (@current_user.role == "admin")
  end
end
