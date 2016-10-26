class Item < ApplicationRecord
  belongs_to :user
  belongs_to :inventory

  validates_presence_of :name, :quantity, :price

  #validates :price, numericality: { greater_than: 0.0 }

  scope :items_by_user, ->(user) { where(user_id: user.id) }
  scope :items_by_inventory, ->(inventory) { where(inventory_id: inventory.id) }

end
