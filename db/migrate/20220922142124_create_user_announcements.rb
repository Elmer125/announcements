class CreateUserAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :user_announcements do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :announcement, null: false, foreign_key: true
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
