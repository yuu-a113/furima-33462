class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_num, :purcahse_id, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "is invalid"}
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, phone_num: phone_num, purchase_id: purchase.id)
  end
end