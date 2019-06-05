class CreateRiversTable < ActiveRecord::Migration[5.2]
  
  def change

    create_table :rivers do |t|
      t.string :name
      t.integer :continent_id 
      t.integer :num_countries_pass_through 
    end 
  end
end
