class V1::FinancialTransactionsController < ApplicationController
  before_action :set_financial_transaction, only: [:show, :update, :destroy]
  before_action :authorize_access_request!

  def index
    @financial_transactions = current_user.financial_transactions

    render json: @financial_transactions
  end

  # GET /financial_transactions/1
  def show
    render json: @financial_transaction
  end

  # POST /financial_transactions
  def create
    @financial_transaction = current_user.financial_transactions(financial_transaction_params)

    if @financial_transaction.save
      render json: @financial_transaction, status: :created, location: @financial_transaction
    else
      render json: @financial_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /financial_transactions/1
  def update
    if @financial_transaction.update(financial_transaction_params)
      render json: @financial_transaction
    else
      render json: @financial_transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def financial_transaction
    ActiveRecord::Base.financial_transaction do
      @financial_transaction && update_balance ? (true) : (raise ActiveRecord::Rollback)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_financial_transaction
    @financial_transaction = current_user.financial_transactions.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def financial_transaction_params
    params.require(:financial_transaction).permit(:amount, :type)
  end

  def update_balance
    current_user.bank_account.balance_update(@transaction.id)
  end
end
