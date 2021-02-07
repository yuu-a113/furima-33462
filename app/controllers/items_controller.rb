class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user.id || @item.purchase.nil?
      redirect_to action: :index
    end
  end

  def update
    if item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
    
  def show
  end
  
  def destroy
    if current_user.id == @item.user.id
      if item.destroy
        redirect_to items_path
      else
        render :show
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end



end