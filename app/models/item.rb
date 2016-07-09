class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    self.where("inventory > ?", 0)
  end

  def price_display
    "$#{price/100}"
  end

end
