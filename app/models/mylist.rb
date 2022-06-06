class Mylist < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
  end
  validates :text, length: { maximum: 200 }
end
