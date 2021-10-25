class AddKeyToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :key, :string
  end
end
