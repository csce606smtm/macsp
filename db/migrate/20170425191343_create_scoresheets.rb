class CreateScoresheets < ActiveRecord::Migration
  def change
    create_table :scoresheets do |t|
      t.references :auctioneer, foreign_key: true, null:false
      t.references :question, foreign_key: true, null:false
      t.string :score
      t.timestamps null: false
    end
  end
end
