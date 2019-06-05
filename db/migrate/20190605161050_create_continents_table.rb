class CreateContinentsTable < ActiveRecord::Migration[5.2]
  def change

    create_table :continents do |t|
      t.string :name
      t.integer :number_of_countries 
    end 
  end
end
