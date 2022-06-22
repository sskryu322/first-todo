class Mylist < ApplicationRecord
  belongs_to :user
  has_many_attached :main_images #追加

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :start_time
  end
  validates :text, length: { maximum: 200 }
  validate :images_length
  

  private
  def images_length
    if main_images.length > 6
      errors.add(:main_images)
    end
  end
end
