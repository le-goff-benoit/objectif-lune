class CreateUsersGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :groups
  end
end
