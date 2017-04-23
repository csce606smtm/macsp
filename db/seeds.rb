# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {:email => 'admin@gmail.com',
     :password => '123',
     :name => 'Lance',
     :user_type =>"Admin"}, 
    {:email => 'judge1@gmail.com',
     :password => '123',
     :name => 'Sungkuen Kim',
     :user_type =>"Judge",
     :bare_password => "123"}, 
    {:email => 'judge2@gmail.com',
     :password => '123',
     :name => 'Donghwa Shin',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {:email => 'judge3@gmail.com',
     :password => '123',
     :name => 'Taejun Jeon',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {:email => 'auctioneer1@gmail.com',
     :password => '123',
     :name => 'Eric',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    {:email => 'auctioneer2@gmail.com',
     :password => '123',
     :name => 'Aaron',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    {:email => 'auctioneer3@gmail.com',
     :password => '123',
     :name => 'Hannah',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    ]

users.each do |user|
    u = User.new(user)
    u.save
end

