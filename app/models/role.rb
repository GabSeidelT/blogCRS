class Role < ApplicationRecord
    has_many :user

    validates_presence_of :username

    validates_length_of :username, maximum: 16
end
