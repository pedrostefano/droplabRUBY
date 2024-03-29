class User < ApplicationRecord

  has_many :inventories
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates_presence_of :first_name, :last_name

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
