class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :is_active, inclusion: { in: [true, false] }

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
