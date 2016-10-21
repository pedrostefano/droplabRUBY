class ItemsController < AuthController

  before_action :set_inventory
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :json, only: [:index , :show]

  def index
    @items = Item.items_by(@inventory)
    respond_with(@items)
  end

  def new
    @item = Item.new(:inventory=>@inventory)
  end

  def create
    @item = @inventory.items.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to inventory_items_path, notice: 'Your item was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      @inventory = Inventory.find(@item.inventory_id)
      redirect_to inventory_items_path(@inventory), notice: 'Your item was edited successfully'
    else
      render :edit
    end
  end

  def show
    respond_with(@item)
  end

  def destroy
    #@inventory = Inventory.find(@item.inventory_id)
    @item.delete
    redirect_to inventory_items_path(@inventory), notice: 'Your item was deleted successfully'
  end

  private

    def item_params
      params.require(:item).permit(:name, :quantity, :price, :inventory_id)
    end

    def set_inventory
      @inventory = Inventory.find(params[:inventory_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
