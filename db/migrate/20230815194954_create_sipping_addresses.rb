class CreateSippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :sipping_addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :send_origin_id, null: false
      t.string     :city,           null: false
      t.string     :street_address, null: false
      t.string     :building        
      t.string     :phone_number,   null: false
      t.references :item,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
