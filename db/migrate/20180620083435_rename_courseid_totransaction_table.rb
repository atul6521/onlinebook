class RenameCourseidTotransactionTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :course_id, :book_id
  end
end
