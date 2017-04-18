class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|

      t.timestamps null: false
    end
    
#    add_foreign_key :judges, :users
#    add_foreign_key :judges, :contests
  end
end
