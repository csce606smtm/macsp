# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {
     :email => 'admin@gmail.com',
     :password => '123',
     :name => 'Lance',
     :user_type =>"Admin"}, 
    {
     :email => 'judge1@gmail.com',
     :password => '123',
     :name => 'Sungkuen Kim',
     :user_type =>"Judge",
     :bare_password => "123"}, 
    {
     :email => 'judge2@gmail.com',
     :password => '123',
     :name => 'Donghwa Shin',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {
     :email => 'judge3@gmail.com',
     :password => '123',
     :name => 'Taejun Jeon',
     :user_type =>"Judge",
     :bare_password => "123"
    }, 
    {
     :email => 'auctioneer1@gmail.com',
     :password => '123',
     :name => 'Eric',
     :user_type =>"Auctioneer",
     :bare_password => "123"
    }, 
    ]

users.each do |user|
    User.create!(user)
end

contests = [
 {
  :contest_name => "LoneStar 2017"},
 {
  :contest_name => "Texas 2016"},
 ]
contests.each do |contest|
     Contest.create!(contest)
end

divisions = [
    {
     :contest_id => 1,
     :division_name => "rookie",
     :round => 1}, 
    {
     :contest_id => 1,
     :division_name => "rookie",
     :round => 2}, 
    {
     :contest_id => 1,
     :division_name => "veteran",
     :round => 1}, 
    {
     :contest_id => 2, 
     :division_name => "rookie",
     :round => 1}, 
    ]

divisions.each do |division|
    Division.create!(division)
end

judges = [
 {
  :user_id => 2,
  :contest_id => 1},
 {
  :user_id => 2,
  :contest_id => 2},
 {
  :user_id => 3,
  :contest_id => 2},
  {
  :user_id => 4,
  :contest_id => 2},
 ]
 
 judges.each do |judge|
  Judge.create!(judge)
 end
 
 
 auctioneers = [
  {
  :user_id => 5, 
  :division_id => 1},
  ]
 auctioneers.each do |auctioneer|
  Auctioneer.create!(auctioneer)
 end
 
 questions = [
  {
  :qsheet_id => 1,
  :dataType => "I",
  :content => "test questions 1"},
  {
  :qsheet_id => 2,
  :dataType => "I",
  :content => "test questions 2"},
  {
  :qsheet_id => 3,
  :dataType => "I",
  :content => "test question 3"},
  {
  :qsheet_id => 4,
  :dataType => "S",
  :content => "test question 4"},
  ]
  
  
  questions.each do |q|
   Question.create!(q)
  end
  
  
qsheets = [
 {
  :division_id => 1},
 {
  :division_id => 2},
 {
  :division_id => 3},
 {
  :division_id => 4},
 ]
 
 
 qsheets.each do |qsh|
  Qsheet.create!(qsh)
 end
 
 
 
 scoresheets = [
  {
  :auctioneer_id => 1,
  :question_id => 1,
  :score => "empty"},
  ]
  
  
 scoresheets.each do |sh|
  Scoresheet.create!(sh)
 end
 
 