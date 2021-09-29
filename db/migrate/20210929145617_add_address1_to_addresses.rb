class AddAddress1ToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :address1, :string
  end
end
