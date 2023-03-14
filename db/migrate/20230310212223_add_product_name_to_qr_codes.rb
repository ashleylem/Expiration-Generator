class AddProductNameToQrCodes < ActiveRecord::Migration[7.0]
  def change
    add_column :qr_codes, :product_name, :string
  end
end
