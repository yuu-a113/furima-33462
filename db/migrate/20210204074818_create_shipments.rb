class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|

      t.string :postal_code,       null: false
      t.integer :prefecture_id,    null: false
      t.string :city,              null: false
      t.string :street_address,    null: false
      t.string :building
      t.string :phone_num,         null: false
      t.timestamps
      t.references :purchase, foreign_key: true

    end
  end
end
