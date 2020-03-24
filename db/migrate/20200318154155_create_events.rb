class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :fees
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
