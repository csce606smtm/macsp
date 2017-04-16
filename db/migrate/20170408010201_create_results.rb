class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|

      t.timestamps null: false
    end
    
    add_foreign_key :results, :divisions
    add_foreign_key :results, :judges
    add_foreign_key :results, :auctioneers
    add_foreign_key :results, :questions
  end
end
