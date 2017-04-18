class CreateScoresheets < ActiveRecord::Migration
  def change
    create_table :scoresheets do |t|

      t.timestamps null: false
    end
    
#    add_foreign_key :scoresheets, :divisions
#    add_foreign_key :scoresheets, :questions
  end
end
