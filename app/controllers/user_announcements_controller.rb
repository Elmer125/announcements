class UserAnnouncementsController < ApplicationController
  before_action :set_user_announcement, only: %i[update]

  def update
    @user_announcement.update(user_announcement_params)
    redirect_to announcements_path
  end

  private

  def set_user_announcement
    @user_announcement = UserAnnouncement.find(params[:id])
  end

  def user_announcement_params
    params.require(:user_announcement).permit(:seen)
  end
end
