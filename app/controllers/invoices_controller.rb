class InvoicesController < ApplicationController
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

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @invoice = Invoice.find(params[:id])
    end
end
