class ModifyCommentsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :name, :string
    add_column :comments, :article_id, :integer
  end
end
