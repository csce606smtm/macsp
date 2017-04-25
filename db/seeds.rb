# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {:id => 1,
     :email => 'admin@gmail.com',
     :password => '123',
     :name => 'Lance',
     :user_type =>"Admin"}, 
    {:id => 2,
     :email => 'judge1@gmail.com',
     :password => '123',
     :name => 'Sungkuen Kim',
     :user_type =>"Judge",
     :bare_password => "123"}, 
    {:id => 3,
     :email => 'judge2@gmail.com',
     :password => '123',
     :name => 'Donghwa Shin',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {:id => 4,
     :email => 'judge3@gmail.com',
     :password => '123',
     :name => 'Taejun Jeon',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {:id => 5,
     :email => 'auctioneer1@gmail.com',
     :password => '123',
     :name => 'Eric',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    {:id => 6,
     :email => 'auctioneer2@gmail.com',
     :password => '123',
     :name => 'Aaron',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    {:id => 7,
     :email => 'auctioneer3@gmail.com',
     :password => '123',
     :name => 'Hannah',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    ]

users.each do |user|
    User.create(user)
end

contests = [
 {:id => 1,
  :contest_name => "LoneStart 2017"},
 {:id => 2,
  :contest_name => "Texas 2016"},
 ]
contests.each do |contest|
     Contest.create(contest)
end

divisions = [
    {:id => 1,
     :contest_id => 1,
     :division_name => "rookie",
     :round => 1}, 
    {:id => 2,
     :contest_id => 1,
     :division_name => "rookie",
     :round => 2}, 
    {:id => 3,
     :contest_id => 1,
     :division_name => "veteran",
     :round => 1}, 
    {:id => 4,
     :contest_id => 2, 
     :division_name => "rookie",
     :round => 1}, 
    {:id => 5,
     :contest_id => 2, 
     :division_name => "rookie",
     :round => 2}, 
    {:id => 6,
     :contest_id => 2, 
     :division_name => "veteran",
     :round => 1}, 
    {:id => 7,
     :contest_id => 2, 
     :division_name => "champion",
     :round => 1}, 
    ]

divisions.each do |division|
    Division.create(division)
end

judges = [
 {:id => 1,
  :user_id => 2,
  :contest_id => 1},
 {:id => 2,
  :user_id => 3,
  :contest_id => 2},
  {:id => 3,
  :user_id => 4,
  :contest_id => 2},
 ]
 
 judges.each do |judge|
  Judge.create(judge)
 end
 
 
 auctioneers = [
  {:id => 1,
  :user_id => 5, 
  :division_id =>1},
  {:id => 2,
  :user_id => 6,
  :division_id => 2},
  {:id => 3,
  :user_id => 7,
  :division_id => 4},
  ]
 auctioneers.each do |auctioneer|
  Auctioneer.create(auctioneer)
 end
 
 questions = [
  {:id => 1,
  :dataType => "int",
  :content => "question1"},
  {:id => 2,
  :dataType => "string",
  :content => "question3"},
  {:id => 3,
  :dataType => "int",
  :content => "question3"},
  {:id => 4,
  :dataType => "string",
  :content => "question4"},
  {:id => 5,
  :dataType => "int",
  :content => "question5"},
  {:id => 6,
  :dataType => "string",
  :content => "question6"},
  {:id => 7,
  :dataType => "int",
  :content => "question7"},
  {:id => 8,
  :dataType => "string",
  :content => "question8"},
  {:id => 9,
  :dataType => "int",
  :content => "question9"},
  {:id => 10,
  :dataType => "string",
  :content => "question10"},
  {:id => 11,
  :dataType => "int",
  :content => "question11"},
  ]
  
  
  questions.each do |q|
   Question.create(q)
  end
  
  
qsheets = [
 {:id => 1,
  :division_id => 1,
  :question_id => 1},
 {:id => 2,
  :division_id => 1,
  :question_id => 2},
 {:id => 3,
  :division_id => 1,
  :question_id => 3},
 {:id => 4,
  :division_id => 1,
  :question_id => 4},
 {:id => 5,
  :division_id => 1,
  :question_id => 5},
 {:id => 6,
  :division_id => 1,
  :question_id => 6},
 {:id => 7,
  :division_id => 2,
  :question_id => 1},
 {:id => 8,
  :division_id => 2,
  :question_id => 2},
 {:id => 9,
  :division_id => 2,
  :question_id => 3},
 {:id => 10,
  :division_id => 2,
  :question_id => 4},
 {:id => 11,
  :division_id => 2,
  :question_id => 5},
 {:id => 12,
  :division_id => 2,
  :question_id => 6},
 ]
 
 
 qsheets.each do |qsh|
  Qsheet.create(qsh)
 end
 
 
 
 scoresheets [
  {:id => 1,
  :auctioneer_id => 1,
  :question_id => 2,
  :score => "10"},
  ]
  
  
  scoresheets.each do |sh|
   Scoresheet.create(sh)
  end