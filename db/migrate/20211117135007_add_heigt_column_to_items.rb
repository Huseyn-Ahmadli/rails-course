class AddHeigtColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :height, :float
  end
end
