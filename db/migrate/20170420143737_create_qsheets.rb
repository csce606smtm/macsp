class CreateQsheets < ActiveRecord::Migration
  def change
    create_table :qsheets do |t|
      t.references :division, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps null: false
    end
  end
end
