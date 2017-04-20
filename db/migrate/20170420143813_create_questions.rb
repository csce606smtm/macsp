class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.string :content
      t.integer :qsheet_id

      t.timestamps null: false
    end
  end
end
