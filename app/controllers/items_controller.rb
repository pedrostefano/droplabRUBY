class ItemsController < AuthController

  before_action :set_inventory, only: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :json, only: [:index , :show]

  def index
    @items = Item.items_by_user(current_user)
    if params[:inventory_id]
      @items = @items.items_by_inventory(@inventory)
    end

    respond_with(@items)
  end

  def new
    @item = Item.new(:inventory=>@inventory)
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to items_path, notice: 'Your item was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Your item was edited successfully'
    else
      render :edit
    end
  end

  def show
    respond_with(@item)
  end

  def destroy
    @item.delete
    redirect_to items_path, notice: 'Your item was deleted successfully'
  end

  private

    def item_params
      params.require(:item).permit(:name, :quantity, :price, :inventory_id)
    end

    def set_inventory
      if params[:inventory_id]
        @inventory = Inventory.find(params[:inventory_id])
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
