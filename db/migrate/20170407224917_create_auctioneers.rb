class CreateAuctioneers < ActiveRecord::Migration
  def change
    create_table :auctioneers do |t|
      
      t.timestamps null: false
    end
    
    add_foreign_key :auctioneers, :users
    add_foreign_key :auctioneers, :divisions
  end
end
