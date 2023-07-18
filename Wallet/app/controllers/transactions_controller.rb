class TransactionsController < ApplicationController
    def index
      @transactions = Transaction.all
      @new_transaction = Transaction.new
    end
  
    def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        redirect_to transactions_path, notice: 'Transaction successfully created.'
      else
        render :index
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :date)
    end
  end
  