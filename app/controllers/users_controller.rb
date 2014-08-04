class UsersController < ApplicationController

  def collection
    @user = User.find(params[:id])
  end

end
