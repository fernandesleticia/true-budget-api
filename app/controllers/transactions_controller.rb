class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    render json: { message: 'Transaction' }
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def transactions_params
    params.require(:transaction).permit(:description, :amount, :transaction_date, :category_id, :user_id)
  end
end
