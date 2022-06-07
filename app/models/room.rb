class Room < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :grouplists

  with_options presence: true do
    validates :name, length: { maximum: 40 }
  end
end
