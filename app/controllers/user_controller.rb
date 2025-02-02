class UserController < ApplicationController
  def new
    @users = User.new
  end
end
