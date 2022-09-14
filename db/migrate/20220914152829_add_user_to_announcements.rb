class AddUserToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_reference :announcements, :user, null: false, foreign_key: true
  end
end
