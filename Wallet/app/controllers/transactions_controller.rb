# app/controllers/transactions_controller.rb

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
        @transactions = Transaction.all # Retrieve transactions again for displaying the list
        @new_transaction = @transaction # Set @new_transaction to @transaction with validation errors
        render :index
      end
    end
    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
        redirect_to transactions_path, notice: 'Transaction successfully deleted.'
      end
    private
  
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :date)
    end
  end
  