class Judge < ActiveRecord::Base
    belongs_to :user
    has_many :contests
end
