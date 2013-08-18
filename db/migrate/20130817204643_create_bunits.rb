class CreateBunits < ActiveRecord::Migration
  def change
    create_table :bunits do |t|
    	t.string :name

      t.timestamps
    end
    add_column :bunits, :user_id, :integer
      add_index :bunits, :user_id
  end
end
