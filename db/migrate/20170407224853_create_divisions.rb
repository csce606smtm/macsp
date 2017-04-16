class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer :round
      t.integer :c_id
      t.string :status

      t.timestamps null: false
    end
    
    add_foreign_key :divisions, :contests
  end
end
