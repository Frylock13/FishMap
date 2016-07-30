# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Category.count == 0
  Category.create!(name: 'Болото', marker_image: File.new("#{Rails.root}/db/seeds/markers/lake.png"))
  Category.create!(name: 'Озеро', marker_image: File.new("#{Rails.root}/db/seeds/markers/swamp.png"))
end

if Place.count == 0
  Place.create(title: 'Очень крутое место в Москве', 
               description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                             quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                             cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
               address: 'Москва, Патриаршие пруды',
               active: true, 
               category_id: Category.first.id)
  Place.create(title: 'Очень крутое место в Санкт-Петербурге', 
               description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                             quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                             cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
               address: 'Санкт-Петербург, Нева',
               active: true, 
               category_id: Category.last.id)
end

if Page.count == 0
  Page.create(title: 'Описание сайта', body: '<strong>Описание</strong>', slug: 'about', active: true)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0
