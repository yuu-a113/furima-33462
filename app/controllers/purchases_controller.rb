class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  
  def index
    @purchase_shipment = PurchaseShipment.new
  end

  def create
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      pay_item
      @purchase_shipment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipment).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_num).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token], 
        currency: 'jpy' 
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.purchase.present? || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
