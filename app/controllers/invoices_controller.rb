class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all.select(:id, :name, :target_name, :admin_name, :amount, :taibu, :naiyou, :created_at)
    render json:  {tableData: {
      header: ["ID", "Tên hóa đơn", "Đối tượng","Người làm hóa đơn","Số tiền", "Loại", "Ghi chú", "Ngày làm hóa đơn"], 
      data: @invoices
    }}
  end

  def show
    render json: @invoice
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      render json: @invoice, status: :ok
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:name, :target_name, :admin_name, :amount, :taibu, :naiyou)
    end
end
