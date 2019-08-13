class AddDefaultStringToStatusColumnBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :status
    add_column :bookings, :status, :string, default: "pending"
  end
end
