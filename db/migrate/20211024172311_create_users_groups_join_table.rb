class CreateUsersGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :users do |t|
      t.index [:group_id, :user_id]
    end
  end
end
