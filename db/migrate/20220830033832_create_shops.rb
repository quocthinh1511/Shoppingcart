class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.references :user
      t.string :description 
      t.string :phone 
      t.string :tax_code
      t.string :avatar 
      t.timestamps
    end
    add_column :shops, :shop_digest, :string
    add_column :shops, :shop_mail_at, :datetime
  end
end
