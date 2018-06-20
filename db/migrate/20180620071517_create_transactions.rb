class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer  :user_id
      t.integer  :course_id
      t.json     :notification_params
      t.string   :status
      t.string   :transaction_id
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
