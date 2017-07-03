# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Position.delete_all
Position.create!(:align => 'left')
Position.create!(:align => 'center')
Position.create!(:align => 'right')

User.delete_all
User.create!(:email => 'sitetest.255@gmail.com', :name => 'admin', :password => 'a123d123m', :activated_at => Time.now, :activated => true, :admin => true)