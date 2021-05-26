class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email
  validates :last_name, :location, presence: true

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  after_create :create_cart
  after_create :add_genuine

  def create_cart
    Cart.create!(user_id: self.id)
  end

  def add_genuine
    self.add_role :genuine
  end
     
  def full_name
    return "#{first_name} #{last_name}"
  end
end
