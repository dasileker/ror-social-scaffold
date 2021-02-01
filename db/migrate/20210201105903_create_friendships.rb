class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
