class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :product
      t.references :cart_session
      t.string :order_status
      t.integer :quantity 
      t.integer :unit_price , default:0
      t.integer :total_price ,default:0
      t.timestamps
    end
  end
end
