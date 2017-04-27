class Division < ActiveRecord::Base
    belongs_to :contests, class_name: 'Contest', foreign_key: 'user_id'
    has_many :auctioneers
    has_many :qsheet
    #establish_connection :the_database
end
