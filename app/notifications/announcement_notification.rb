# To deliver this notification:
#
# AnnouncementNotification.with(post: @post).deliver_later(current_user)
# AnnouncementNotification.with(post: @post).deliver(current_user)

class AnnouncementNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @announcement = Announcement.find(params[:announcement][:id])
    @user = User.find(@announcement.user_id)
    "#{@user.name} has created a new announcement"
  end

  def url
    announcement_path(Announcement.find(params[:announcement][:id]))
  end
end
