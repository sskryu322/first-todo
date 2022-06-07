class Grouplist < ApplicationRecord
  has_many :messages,dependent: :destroy
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :start_time
  end
  validates :text, length: { maximum: 200 }
end
