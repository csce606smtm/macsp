class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :qsheet
      t.string :dataType
      t.string :content

      t.timestamps null: false
    end
  end
end
