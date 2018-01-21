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

  def login
    authenticate(params[:username], params[:password])
  end

  def authenticate(email, password)
    token = AuthenticateUser.new(email, password).call

    if token.present?
      render json: {
        token: token,
        message: 'Login Successful'
      }
    else
      render json: nil,  status: :unauthorized
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :address_line_1, :dob, :username, :email, :password, :password_confirmation)
  end

end
