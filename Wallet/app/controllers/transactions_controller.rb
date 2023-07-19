class TransactionsController < ApplicationController
    def index
      @transactions = Transaction.order(date: :desc)
      @new_transaction = Transaction.new
    end

    def create
      @transaction = Transaction.new(transaction_params)
  
      respond_to do |format|
        if @transaction.save
          format.html { redirect_to transactions_path, notice: 'Transaction successfully created.' }
          format.json { render json: { redirect: transactions_path } }
        else
          format.html do
            @transactions = Transaction.all
            @new_transaction = @transaction
            render :index
          end
          format.json { render json: { errors: @transaction.errors.full_messages } }
        end
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
  