class AddCommentIdToGoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :goods, :comment, null: false, foreign_key: true
  end
end
