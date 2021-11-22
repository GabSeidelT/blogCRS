class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_cats, dependent: :delete_all

  validates_presence_of :name
  validates_presence_of :summary

  validates_length_of :name, maximum: 16
  validates_length_of :summary, maximum: 255
end
