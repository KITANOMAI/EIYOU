class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user

  has_one_attached :image
end
