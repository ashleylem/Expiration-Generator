class AddExpirationCodeToQrCodes < ActiveRecord::Migration[7.0]
  def change
    add_column :qr_codes, :expiration_code, :string
  end
end
