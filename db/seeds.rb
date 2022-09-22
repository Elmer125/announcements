# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'elmer@example.com', name: 'Mauricio', last_name: 'Marulanda', password: 'password',
            password_confirmation: 'password')
User.create(email: 'rails@example.com', name: 'Rails', last_name: 'tutorial', password: 'password',
            password_confirmation: 'password')

10.times do |i|
  Announcement.create(content: "Announcement #{i}", expire: Time.now + 5.day, user_id: User.first.id)
  users = User.all
  users.each do |_user|
    UserAnnouncement.create(user_id: _user.id, announcement_id: Announcement.last.id)
  end
end
