class AddArtToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :article_title, :string
    add_column :reviews, :article_link, :string
  end
end
