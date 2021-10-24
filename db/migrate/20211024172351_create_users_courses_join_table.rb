class CreateUsersCoursesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :courses
  end
end
