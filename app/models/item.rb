class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: { greater_than: 300, less_than: 9999999 }, 
              format: {with: VALID_PRICE_REGEX}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id 
    validates :prefecture_id
    validates :shipping_day_id
  end
end