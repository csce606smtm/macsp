class Auctioneer < ActiveRecord::Base
    belongs_to :division
    belongs_to :user
end
