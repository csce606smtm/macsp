class Question < ActiveRecord::Base
    has_many :qsheets
    belongs_to :scoresheet
    #establish_connection :the_database
end
