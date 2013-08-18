class CreateTableWars < ActiveRecord::Migration
  def change
    create_table :table_wars do |t|

      t.timestamps
    end
  end
end
