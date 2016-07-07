class UsersController < ApplicationController
  def index
    all_users = User.all

    render json: all_users.to_json, status: 200
  end
end
