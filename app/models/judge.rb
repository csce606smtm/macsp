class Judge < ActiveRecord::Base
    belongs_to :user
    belongs_to :contests
end
