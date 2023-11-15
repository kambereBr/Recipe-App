class AddDescriptionToInventories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :description, :text, default: ""
  end
end
