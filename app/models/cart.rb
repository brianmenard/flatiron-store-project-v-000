class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    line_items.collect do |line_item|
      line_item.quantity * line_item.item.price
    end.inject { |sum, items_cost| sum + items_cost }
  end

  def add_item(new_item_id)
    new_item = Item.find_by(id: new_item_id)
    if items.include?(new_item)
      found_line_item = line_items.find_by(item_id: new_item.id)
      found_line_item.quantity += 1
      found_line_item
    else
      new_line_item = new_item.line_items.build(quantity: 1)
      new_line_item.cart = self
      new_line_item
    end
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    self.status = "submitted"
    self.save
  end

end
