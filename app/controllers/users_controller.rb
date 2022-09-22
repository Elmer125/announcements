class UsersController < ApplicationController
  before_action :set_user, only: %i[profile]
  def profile
    @announcement = Announcement.where(user_id: @user.id).order(created_at: :desc).paginate(page: params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
