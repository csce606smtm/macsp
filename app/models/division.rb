class Division < ActiveRecord::Base
    belongs_to :contests, class_name: 'Contest', foreign_key: 'contest_id'

    has_many :auctioneers
    has_many :qsheet
    
    def name_with_round
        @Contest = Contest.find(contest_id)
        @Contest.contest_name + " #{division_name.capitalize} #{round}"
  end
    
end
