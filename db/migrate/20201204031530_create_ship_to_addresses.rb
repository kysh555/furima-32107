class CreateShipToAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_to_addresses do |t|

      t.timestamps
    end
  end
end
