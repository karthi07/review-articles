class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :desc
      t.string :source, null: false
      t.string :tag, null: false
      t.string :link, null: false

      t.timestamps
    end
  end
end
