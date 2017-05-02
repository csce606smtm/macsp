class Auctioneer < ActiveRecord::Base
    belongs_to :division
    belongs_to :user
    has_many :scoresheet
    belongs_to :judge
end
