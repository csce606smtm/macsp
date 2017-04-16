class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.integer :name
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
