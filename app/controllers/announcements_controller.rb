class AnnouncementsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_announcement, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @announcements = Announcement.all.order(created_at: :desc)
  end

  def show; end

  def new
    @announcement = Announcement.new
  end

  def edit; end

  def create
    @announcement = Announcement.new(announcement_params)
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

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:content, :expire, :see)
  end

  def correct_user
    @announcement = current_user.announcements.find_by(id: params[:id])
    redirect_to root_path, notice: 'Not authorized to edit this announcement' if @announcement.nil?
  end
end
