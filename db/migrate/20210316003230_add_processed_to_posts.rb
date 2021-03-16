class AddProcessedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :processed, :boolean, default: false, null: false
  end
end
