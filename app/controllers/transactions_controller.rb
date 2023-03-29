class TransactionsController < BaseController
  def index
    transactions = Transaction.all
    render json: Transaction.serialize(transactions), status: :ok
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction.to_hash, status: :ok
  end

  def create
    transaction = Transaction.new(transaction_params)

    response = if transaction.save
      { json: { message: I18n.t("transaction.created"), transaction: transaction }, status: :ok }
    else
      { json: { message: I18n.t("transaction.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def transactions_params
    params.require(:transaction).permit(:description, :amount, :transaction_date, :category_id, :user_id)
  end
end
