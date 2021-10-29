class Product < ApplicationRecord
  belongs_to :category
  #has_many :orders, dependent: :destroy
  has_one_attached :image, :dependent => :destroy 
end

