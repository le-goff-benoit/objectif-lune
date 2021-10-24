class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.boolean :privacy
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end