class UsersController < ApplicationController

  # POST /users/register
  def register
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:first_name, :last_name, :address_line_1, :dob, :username, :email, :password, :password_confirmation)
  end

end
