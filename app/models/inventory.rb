class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  validates_presence_of :name, :description

  scope :inventories_by, ->(user) { where(user_id: user.id) }

end
