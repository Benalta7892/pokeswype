class Exchange < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :dealer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :card_interests
  has_many :reviews
  has_many :cards, through: :card_interests
  has_one :chatroom
  has_one_attached :qrcode, dependent: :destroy

  before_commit :generate_qrcode, on: :create

  enum status: { pending: 0, accepted: 1, rejected: 2, finished: 3 }

  def cards_as_receiver
    card_interests.where(user: receiver)
  end

  def cards_as_dealer
    card_interests.where(user: dealer)
  end

  def default_url_options
    Rails.application.config.default_url_options
  end

  private

  def generate_qrcode
    # Get the host
    # host = Rails.application.routes.default_url_options[:host]
    # host = Rails.application.config.action_controller.default_url_options[:host]

    # Create the QR code object
    # qrcode = RQRCode::QRCode.new("http://#{host}/posts/#{id}")
    qrcode = RQRCode::QRCode.new(status_exchange_url(self))

    # Create a new PNG object
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    # Attach the QR code to the active storage
    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png"
    )
  end
end
