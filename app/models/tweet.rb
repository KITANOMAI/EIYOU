class Tweet < ApplicationRecord
  #tweetsテーブルから中間テーブルに対する関連付け
  has_many :tweet_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :tweet_tag_relations, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user


end
