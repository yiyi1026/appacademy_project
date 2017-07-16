class Api::UsersController < ApplicationController
  def create
    @user = User.new(username, password)

    if @user.save
      login(@user)
      # redirect_to  # somewhere????
    else
      flash.now[:errors] = user.errors.full_messages
    end
  end
end
