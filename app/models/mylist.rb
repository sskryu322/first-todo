class Mylist < ApplicationRecord
  belongs_to :user
  has_many_attached :main_images #追加

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :start_time
  end
  validates :text, length: { maximum: 200 }
end
