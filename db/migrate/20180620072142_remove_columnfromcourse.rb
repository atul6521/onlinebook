class RemoveColumnfromcourse < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :notification_params, :json
    remove_column :courses, :status, :string
    remove_column :courses, :transaction_id, :string
    remove_column :courses, :purchased_at, :datetime
  end
end
