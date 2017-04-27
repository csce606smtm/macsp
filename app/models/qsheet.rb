class Qsheet < ActiveRecord::Base
    belongs_to :questions
    belongs_to :division
    accepts_nested_attributes_for :questions
    #establish_connection :the_database
end
