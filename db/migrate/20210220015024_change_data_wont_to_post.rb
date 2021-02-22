class ChangeDataWontToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :wont, :string
  end
end
