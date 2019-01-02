class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  skip_before_action :authenticate_request, only: [:fetch_all_teachers, :fetch_all_students]
  # GET /users
  # GET /users.json
  def index
    @users = User.all.select(:id, :email, :name, :phone, :role, :created_at, :updated_at)
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.where(id: params[:id]).select(:id, :email, :name, :phone, :role)
    render json: @user, :include => {:account => {only: [:address, :dob, :parent_name, :parent_phone]}}
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # byebug  
    if @user.save
      Account.create! user_id: @user.id, dob: params[:dob], address: params[:address]
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    ActiveRecord::Base.transaction do
      ClassRoomUser.where(user_id: @user.id).delete_all
      @user.destroy
    end
  end

  # def login
  #   authenticate params[:email], params[:password]
  # end

  # def test
  #   render json: {
  #         message: 'You have passed authentication and authorization test'
  #       }
  # end

  def fetch_all_teachers
    @teachers = User.fetch_by_role("teacher").select :id, :email, :name, :phone, :role
    render json: @teachers
  end

  def fetch_all_students
    @students = User.fetch_by_role("student").select :id, :email, :name, :phone, :role
    render json: @students
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:email, :name, :phone, :role, :password, :password_confirmation)
    end

end
