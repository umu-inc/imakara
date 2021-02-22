class AddWontToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :wont, :integer
  end
end
