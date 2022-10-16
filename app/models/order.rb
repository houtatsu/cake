class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :customers, dependent: :destroy
  belongs_to :customer
end
