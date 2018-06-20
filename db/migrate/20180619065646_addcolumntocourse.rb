class Addcolumntocourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :notification_params, :json
    add_column :courses, :status, :string
    add_column :courses, :transaction_id, :string
    add_column :courses, :purchased_at, :datetime
  end
end
