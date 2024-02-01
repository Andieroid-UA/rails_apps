class UsersController < ApplicationController
  # Go to routes.rb and look for /users
  def index
    #debugger
  users = User.all

  render json: users, status: 200
  end

  def show
    user = User.find(params[:id])
    
    render json: user, status: 200
  end
end
