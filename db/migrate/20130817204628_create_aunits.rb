class CreateAunits < ActiveRecord::Migration
  def change
    create_table :aunits do |t|
    	t.string :name

      t.timestamps
    end

    add_column :aunits, :user_id, :integer
      add_index :aunits, :user_id
      
  end
end
