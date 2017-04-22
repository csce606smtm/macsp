class CreateAuctioneers < ActiveRecord::Migration
  def change
    create_table :auctioneers do |t|
      t.references :user, foreign_key: true
      t.references :division, foreign_key: true
      
      t.timestamps null: false
    end
    
#    add_foreign_key :auctioneers, :users
#    add_foreign_key :auctioneers, :divisions
  end
end
