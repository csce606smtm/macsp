class Contest < ActiveRecord::Base
    has_many :divisions
    has_many :judges
end
