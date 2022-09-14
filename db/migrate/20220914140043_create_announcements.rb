class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :content, null: false
      t.datetime :expire
      t.boolean :see, default: false

      t.timestamps
    end
  end
end
