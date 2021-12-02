class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates_presence_of :content

    validates_length_of :content, maximum: 255
end
