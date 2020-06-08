class AddUserRefToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :user, null: false, foreign_key: true, default: 1
  end
end
