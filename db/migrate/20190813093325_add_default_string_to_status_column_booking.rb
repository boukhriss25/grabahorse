class AddDefaultStringToStatusColumnBooking < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, default: "pending"
  end
end
