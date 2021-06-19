class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    users = User.all
    render json: users
  end

  # GET /users/1 or /users/1.json
  def show
    user = User.find(params[:id])
    render json: user
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    user = User.new(user_params)
      if user.save
        render json: user
      else
        render json: {errors: "Cannot create user"}, :status => 420
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if user.update(user_params)
        render json: user
      else
        render json: {errors: "Cannot create user"}, :status => 420
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :city, :state, :birth_year, :birth_day, :about_me)
    end
end
