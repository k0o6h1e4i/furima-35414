class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update, :destroy]
  before_action :find_item, only:[:show, :edit, :update,:destroy]
  before_action :require_item_user, only:[:edit, :update, :destroy]
  
  

 def index
  @items = Item.all.order('created_at DESC')
 end

 def new
  @item = Item.new
 end

 def show
 end

 def edit
 end

 def destroy
     @item.destroy
     redirect_to root_path
    
 end

 def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
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

  def find_item
    @item = Item.find(params[:id])
  end

  def require_item_user
    unless current_user.id == @item.user_id || @item.buyer.present?
      redirect_to root_path    
    end
  end
end
