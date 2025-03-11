class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  with_options presence: true do
    validates :category_id

  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
  end
end
