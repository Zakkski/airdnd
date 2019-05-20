class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :location
      t.string :game
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
