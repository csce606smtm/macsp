class Qsheet < ActiveRecord::Base
    belongs_to :questions
    belongs_to :division
    accepts_nested_attributes_for :questions
end
