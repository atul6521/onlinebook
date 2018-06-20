class Book < ApplicationRecord
  # validation
  has_many :transactions
  has_many :users, through: :transactions
end
