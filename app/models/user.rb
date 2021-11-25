class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one :ability
  belongs_to :role

  def admin?
    role_id == 1
  end
  def comment?
    role_id == 2
  end
  def regular?
    role_id == 3
  end
  
end
