class InventoriesController < AuthController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :approve]

  respond_to :html
  respond_to :json, only: [:index , :show]

  def index
    @inventories = Inventory.inventories_by(current_user)
    respond_with(@inventories)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id

    if @inventory.save
      redirect_to inventories_path, notice: 'Your Inventory was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: 'Your Inventory was edited successfully'
    else
      render :edit
    end
  end

  def show
    respond_with(@inventory)
  end

  def destroy
    if @inventory.destroy
      redirect_to inventories_path, notice: 'Your Inventory was deleted successfully'
    else
      render :index
    end
  end
  private

    def inventory_params
      params.require(:inventory).permit(:name, :description)
    end

    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

end
