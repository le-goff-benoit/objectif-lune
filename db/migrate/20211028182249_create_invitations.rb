class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :invitable, polymorphic: true, null: false
      t.boolean :pending, :default => true

      t.timestamps
    end
  end
end
