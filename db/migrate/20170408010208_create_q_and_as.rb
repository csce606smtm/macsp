class CreateQAndAs < ActiveRecord::Migration
  def change
    create_table :q_and_as do |t|
      t.integer :answer_integer
      t.string :answer_string

      t.timestamps null: false
    end
    
    add_foreign_key :q_and_as, :questions
  end
end
