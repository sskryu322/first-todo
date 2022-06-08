class Room < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :grouplists, dependent: :destroy

  with_options presence: true do
    validates :name, length: { maximum: 40 }
  end
  
  #検索機能
  def self.search(search)
    if search != ""
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
