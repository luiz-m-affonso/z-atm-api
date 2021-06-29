class V1::BankCostumersController < ApplicationController
  before_action :set_bank_costumer, only: [:show, :update, :destroy]

  # GET /bank_costumers
  def index
    @bank_costumers = BankCostumer.all

    render json: @bank_costumers
  end

  # GET /bank_costumers/1
  def show
    render json: @bank_costumer
  end

  # POST /bank_costumers
  def create
    @bank_costumer = BankCostumer.new(bank_costumer_params)

    if @bank_costumer.save
      render json: @bank_costumer, status: :created, location: @bank_costumer
    else
      render json: @bank_costumer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_costumers/1
  def update
    if @bank_costumer.update(bank_costumer_params)
      render json: @bank_costumer
    else
      render json: @bank_costumer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_costumers/1
  def destroy
    @bank_costumer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_costumer
      @bank_costumer = BankCostumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_costumer_params
      params.require(:bank_costumer).permit(:cpf, :password_digest)
    end
end
