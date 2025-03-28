class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy 
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :goods, dependent: :destroy
  has_many :good_comments, through: :goods, source: :comment

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  def already_good?(comment) 
    goods.exists?(user_id: self.id, comment_id: comment.id) 
  end

end
