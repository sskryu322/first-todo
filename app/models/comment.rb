class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :grouplist

  validates :text, presence: true, length: { maximum: 200 }
end
