class CreateLoves < ActiveRecord::Migration[7.1]
  def change
    create_table :loves do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
