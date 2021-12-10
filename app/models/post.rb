class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_cats, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :ratings


  validates_presence_of :name
  validates_presence_of :summary
  validates_presence_of :content

  # validates :image, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }

  validates_length_of :name, maximum: 16
  validates_length_of :summary, maximum: 255
  
  validate :image_type


  private

  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if image.attached? == true
      if image.blob.byte_size > 3000000
        errors.add(:image, 'is too big bro')
      end
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, "needs to be a jpeg or png!")
      end
    end
  end
end