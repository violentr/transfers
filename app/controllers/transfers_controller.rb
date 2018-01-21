class TransfersController < ApplicationController
  before_action :authenticate_request
  before_action :set_transfer, only: [:show, :update, :destroy]
  # GET /transfers
  def index
    @transfers = current_user.transfers

    render json: @transfers, status: :ok
  end

  # GET /transfers/1
  def show
    render json: @transfer
  end

  # POST /transfers
  def create
    @transfer = current_user.transfers.build(transfer_params)
    if @transfer.save
      render json: @transfer, status: :created, location: user_transfer_url(current_user, @transfer)
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transfers/1
  def update
    if transfer_params.present? && @transfer.update(transfer_params)
      render json: @transfer
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transfers/1
  def destroy
    @transfer.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transfer
    @transfer = current_user.transfers.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transfer_params
    attributes = ["account_number_from",
                  "account_number_to",
                  "amount_pennies",
                  "country_code_from",
                  "country_code_to",
                  "user_id"]
    params.permit(attributes)
  end

end
