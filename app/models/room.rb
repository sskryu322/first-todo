class Room < ApplicationRecord
  has_secure_password
  has_many :room_users
  has_many :users, through: :room_users
  has_many :grouplists

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :password
  end



end
