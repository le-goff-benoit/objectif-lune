class AddNullToChannels < ActiveRecord::Migration[7.0]
  def change
    change_column_null :channels, :task_id, true
  end
end
