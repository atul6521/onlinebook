class Transaction < ApplicationRecord
  # validation
  belongs_to :user
  belongs_to :book

  scope :get_completed_status, -> {where.not(status: nil)}

  def paypal_url(return_path) 
    values = {
        business: Rails.application.secrets.merchant_user,
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: self.id,
        amount: book.price,
        item_name: book.name,
        item_number: book.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end