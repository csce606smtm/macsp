class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.string :format

      t.timestamps null: false
    end
  end
end
