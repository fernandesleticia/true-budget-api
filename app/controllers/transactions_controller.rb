class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: 'Transaction' }
  end
end
