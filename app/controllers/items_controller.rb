class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update, :destroy ]
  
 def index
  @items = Item.all.order('created_at DESC')
 end

 def new
  @item = Item.new
 end

 def show
  @item = Item.find(params[:id])
 end

 def edit
  @item = Item.find(params[:id])
  unless current_user.id == @item.user_id
    redirect_to root_path    
  end
 end

 def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
  end
  unless current_user.id == @item.user_id
    redirect_to root_path    
  end
 end

 def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end



  private
  def item_params
    params.require(:item).permit(:title, :text, :price, :state_id, :category_id, :postage_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
