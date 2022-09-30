class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.integer :per
      t.timestamps
    end
  end
end
