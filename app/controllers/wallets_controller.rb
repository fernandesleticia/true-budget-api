class WalletsController < BaseController
  def index
    wallets = Transaction.all
    render json: Wallet.serialize(wallets), status: :ok
  end

  def show
    wallet = Wallet.find(params[:id])
    render json: wallet.to_hash, status: :ok
  end

  def create
    wallet = Wallet.new(wallet_params)

    response = if wallet.save
      { json: { message: I18n.t("wallet.created"), wallet: wallet }, status: :ok }
    else
      { json: { message: I18n.t("wallet.error_creating") }, status: :unprocessable_entity }
    end

    render response
  end

  private

  def wallet_params
    params.require(:wallet).permit(:balance, :user_id)
  end
end
