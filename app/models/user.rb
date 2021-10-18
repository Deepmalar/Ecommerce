class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { guest: 0, admin: 1 }       
  has_many :orders, dependent: :destroy
  #validates :first_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { in: 6..15 }
  #validates :password, length: { in: 6..15 }

end
