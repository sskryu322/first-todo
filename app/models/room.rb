class Room < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :grouplists, dependent: :destroy

  with_options presence: true do
    validates :name, length: { maximum: 40 }
  end
end
