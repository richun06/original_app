# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "テスト管理者", email: "admin@sample.com", password: "111111", password_confirmation: "111111", admin: true)
User.create!(name: "施設", email: "shisetsu@sample.com", password: "111111", password_confirmation: "111111", admin: false, owner_id: 1)
User.create!(name: "テスト花子", email: "hanako@sample.com", password: "111111", password_confirmation: "111111", admin: false)
CareUser.create!(name: "テスト太郎", birthday: '1950-01-01', age: 72, sex: 1, availability: 1, division: 1, user_id: 3)