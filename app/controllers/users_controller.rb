class UsersController < ApplicationController
  before_action :set_user
  def profile
    @announcement = @user.announcements.paginate(page: params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
