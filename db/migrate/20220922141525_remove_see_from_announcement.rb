class RemoveSeeFromAnnouncement < ActiveRecord::Migration[7.0]
  def change
    remove_column :announcements, :see, :boolean
  end
end
