class CreateUsersCoursesJointTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users_courses_joint_tables do |t|

      t.timestamps
    end
  end
end
