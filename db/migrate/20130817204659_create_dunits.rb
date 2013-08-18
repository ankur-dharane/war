class CreateDunits < ActiveRecord::Migration
  def change
    create_table :dunits do |t|
    	t.string :name

      t.timestamps
    end
    add_column :dunits, :user_id, :integer
      add_index :dunits, :user_id
  end
end
