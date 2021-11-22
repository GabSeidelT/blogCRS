class Category < ApplicationRecord
    has_many :post_cats

    validates_presence_of :name
    validates_presence_of :description

    validates_length_of :name, maximum: 16
    validates_length_of :description, maximum: 255
end
