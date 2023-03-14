require 'rqrcode'
require 'rqrcode_svg'
class QrCode < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def qrcode_svg(qr_code_data, size: 4)
    qr = RQRCode::QRCode.new(qr_code_data)
    svg = qr.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: size,
      standalone: true,
      use_path: true
    )

    return svg.html_safe
  end
  # Add this line to include the product_name attribute
  attribute :product_name, :string
end
