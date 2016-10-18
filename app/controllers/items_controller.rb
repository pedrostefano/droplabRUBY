class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Your item was created successfully'
    else
      render :new
    end
  end

  def show
  end

  private

    def item_params
      params.require(:item).permit(:name, :quantity, :price)
    end

    def set_post
      @item = Item.find(params[:id])
    end

end
