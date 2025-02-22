class AddResultKeyToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :result_key, :string
    add_column :tweets, :result_detail, :text
  end
end
