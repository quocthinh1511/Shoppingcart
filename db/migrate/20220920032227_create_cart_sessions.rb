class CreateCartSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_sessions do |t|
      t.references :user
      t.integer :sum
      t.timestamps
    end
  end
end
