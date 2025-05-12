class RemoveCategoryIdFromTodos < ActiveRecord::Migration[7.0]
  def change
    # If you have a foreign-key constraint:
    remove_foreign_key :todos, :categories

    # Then drop the column and its index:
    remove_index :todos, :category_id
    remove_column :todos, :category_id, :bigint
  end
end
