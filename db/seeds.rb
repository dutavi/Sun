# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
USER_EMAIL = "user@#{Rails.application.credentials.domain_name}"
VIP_EMAIL = "vip@#{Rails.application.credentials.domain_name}"
ADMIN_EMAIL = "admin@#{Rails.application.credentials.domain_name}"

User.find_or_create_by!(email: USER_EMAIL) do |user|
  user.password = user.password_confirmation = "Aa@123456"
  user.role = :user
  puts "CREATE #{user.email}"
end

User.find_or_create_by!(email: VIP_EMAIL) do |user|
  user.password = user.password_confirmation = "Aa@123456"
  user.role = :vip
  user.confirm
  puts "CREATE #{user.email}"
end

User.find_or_create_by!(email: ADMIN_EMAIL) do |user|
  user.password = user.password_confirmation = "Aa@123456"
  user.role = :admin
  user.confirm
  puts "CREATE #{user.email}"
end
