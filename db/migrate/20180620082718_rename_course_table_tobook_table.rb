class RenameCourseTableTobookTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :courses, :books
  end
end
