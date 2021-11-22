class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_cats, dependent: :delete_all
end
