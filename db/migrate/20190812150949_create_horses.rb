class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.text :description
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
