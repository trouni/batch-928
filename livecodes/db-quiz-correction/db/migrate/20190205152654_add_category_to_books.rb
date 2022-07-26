class AddCategoryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :category, :string
  end
end
