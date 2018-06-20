class TransactionsController < ApplicationController
  protect_from_forgery except: [:hook]
  def index
    @transactions = current_user.transactions.get_completed_status
  end
  def book 
    @book = Book.find(params[:book_id])   
    @transaction = current_user.transactions.create(book_id: @book.id)
    redirect_to @transaction.paypal_url(transaction_path(@transaction))
  end

  def show  
    @transaction = Transaction.find(params[:id])
  end

  def hook  
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @transaction = Transaction.find params[:invoice]
      @transaction.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end
end
