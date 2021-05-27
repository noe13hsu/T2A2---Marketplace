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
    # create a cart for user after they register a new account
  end

  def add_genuine
    self.add_role :genuine
    # give newly registered user the genuine role 
  end
     
  def full_name
    return "#{first_name} #{last_name}"
    # returns the full name of a user
  end
end
