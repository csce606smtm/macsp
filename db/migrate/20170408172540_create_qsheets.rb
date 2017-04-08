class CreateQsheets < ActiveRecord::Migration
  def change
    create_table :qsheets do |t|
      t.string :contest

      t.timestamps null: false
    end
  end
end
