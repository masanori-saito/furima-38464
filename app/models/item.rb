class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one    :order

  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
 
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :item_status_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :item_status_id
  end
end
