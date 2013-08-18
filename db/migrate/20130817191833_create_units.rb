class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :clicked_id, :default => -1, :null => false


      t.timestamps
    end
    add_column :units, :user_id, :integer
      add_index :units, :user_id
  end
end
