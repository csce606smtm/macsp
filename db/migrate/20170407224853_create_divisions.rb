class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :division_name
      t.integer :round
      t.references :contest, foreign_key: true
      t.string :status
      t.references :qsheet, foreign_key: true

      t.timestamps null: false
    end
    
#    add_foreign_key :divisions, :contests
  end
end
