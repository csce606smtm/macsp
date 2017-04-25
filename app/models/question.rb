class Question < ActiveRecord::Base
    belongs_to :qsheets
    belongs_to :scoresheet
end
