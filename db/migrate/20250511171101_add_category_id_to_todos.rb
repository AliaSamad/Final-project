class AddCategoryIdToTodos < ActiveRecord::Migration[7.0]
  def change
    # allow nulls initially
    add_reference :todos, :category, null: true, foreign_key: true
  end
end

