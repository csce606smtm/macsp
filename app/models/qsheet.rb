class Qsheet < ActiveRecord::Base
    has_many :questions
    belongs_to :division
    accepts_nested_attributes_for :questions
end
