class AddUserRefToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :user_id, :integer
    add_index :blog_comments, :user_id
  end
end
