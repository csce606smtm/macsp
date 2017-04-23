class Division < ActiveRecord::Base
    belongs_to :contests
    has_many :auctioneers
end
