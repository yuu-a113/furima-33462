class Purchase < ApplicationRecord
  has_one :shipment
  
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  

end
