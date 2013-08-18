class CreateCunits < ActiveRecord::Migration
  def change
    create_table :cunits do |t|
    	t.string :name

      t.timestamps
    end
    add_column :cunits, :user_id, :integer
      add_index :cunits, :user_id
  end
end
