class Mylist < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 30 }
    validates :text, length: { maximum: 200 }
    validates :start_time
  end
  
end
