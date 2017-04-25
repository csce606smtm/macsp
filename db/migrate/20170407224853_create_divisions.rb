class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :division_name, null: false
      t.integer :round, null: false
      t.references :contest, foreign_key: true, null:false
      t.string :status
      #t.references :qsheet, foreign_key: true, null:false

      t.timestamps
    end
    
#    add_foreign_key :divisions, :contests
  end
end
