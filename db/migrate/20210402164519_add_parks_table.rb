class AddParksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :park_type
      t.integer :state_id

      t.timestamps
    end
  end
end
