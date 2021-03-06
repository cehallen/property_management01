class Owner < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/,
    message: "Invalid email format" }

  has_many :buildings, 
    dependent: :destroy,
    inverse_of: :owner

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
