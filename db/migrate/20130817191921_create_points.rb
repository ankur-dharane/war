class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :attack_speed
      t.integer :accuracy
      t.integer :speed
      t.integer :attack_damage
      t.integer :defense

      t.timestamps
    end

   	  add_column :points, :unit_id, :integer
      add_index :points, :unit_id
  end
end
