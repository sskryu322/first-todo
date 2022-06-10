class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :grouplist
  belongs_to :room

  validates :text, presence: true, length: { maximum: 200 }
end
