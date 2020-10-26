class AccountsController < ApplicationController
  def index
    render json: Account.order(date: :desc)
  end

  def create
    account = Account.create!(account_params)

    render json: account
  end

  def update
    account = Account.find(params[:id])
    account.update!(account_params)

    render json: account
  end

  def destroy
    account = Account.find(params[:id])
    
    account.destroy!

    render json: account
  end

  private

  def account_params
    params.permit(:name, :number)
  end
end
