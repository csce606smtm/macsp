class Contest < ActiveRecord::Base
    has_many :divisions
    belongs_to :judges
end
