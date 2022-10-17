class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    render json: @wallets
  end

  def show
    @wallet = Wallet.find(params[:id])

    render json: @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.save

    render json: @wallet
  end

  private

  def wallet_params
    params.require(:wallet).permit(:balance, :user_id)
  end
end
