class Scoresheet < ActiveRecord::Base
    belongs_to :auctioneer
    belongs_to :question
    belongs_to :judge
end
