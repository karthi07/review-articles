class AddColsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, default: "", unique: true, null: false
    add_column :users, :fullname, :string, default: "", null: false
  end
end
