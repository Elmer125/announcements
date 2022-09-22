class AnnouncementsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_announcement, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index]
  after_action :create_user_announcement, only: %i[create]
  def index
    @announcements = UserAnnouncement.includes(:user, :announcement).where('seen IS FALSE AND user_id=(?)',
                                                                           current_user.id).order(created_at: :desc).paginate(page: params[:page])

    # @announcements = Announcement.where('expire > (?)',
    #                                    Time.now).all.order(created_at: :desc).paginate(page: params[:page])
    # nouncements = Announcement.where('see IS FALSE').all.order(created_at: :desc).paginate(page: params[:page])
    # @announcements = nouncements.where('expire > ?', Time.now)
  end

  def show
    @user_announcement = UserAnnouncement.find_by(announcement_id: @announcement.id, user_id: current_user.id)
    mark_notification_as_read
  end

  def new
    @announcement = Announcement.new
  end

  def edit; end

  def create
    @announcement = Announcement.new(announcement_params)
    @users = User.all
    # Pasar los datos del user para que pueda crear un anuncio
    @announcement.user = current_user
    if @announcement.save
      redirect_to @announcement, notice: 'Announcement was successfully created.'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @announcement.update(announcement_params)
      redirect_to @announcement, notice: 'Announcement was successfully updated.'
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @announcement.destroy
    redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
  end

  private

  def create_user_announcement
    @users.each do |user|
      @user_announcement = UserAnnouncement.create(user_id: user.id, announcement_id: @announcement.id)
      @user_announcement.save
    end
  end

  def mark_notification_as_read
    if current_user
      notifications_to_mark_as_read = @announcement.notifications_as_announcement.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.now)
    end
  end

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:content, :expire)
  end

  def correct_user
    @announcement = current_user.announcements.find_by(id: params[:id])
    redirect_to root_path, notice: 'Not authorized to edit this announcement' if @announcement.nil?
  end
end
