class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_many :loves, dependent: :destroy
  has_many :loved_users, through: :loves, source: :user

  has_one_attached :image
end
