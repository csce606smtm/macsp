# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {:email => 'admin555@gmail.com',
     :password => '123',
     :name => 'Lance',
     :admin =>"1"}, 
    
    {:email => 'judge555@gmail.com',
     :password => '123',
     :name => 'Lance',
     :admin => "0"}, 
    ]

     #:password_confirmation => '123',

users.each do |user|
    u = User.new(user)
    u.save
end

