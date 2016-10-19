class ItemsController < StaticController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @items = Item.items_by(current_user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to @item, notice: 'Your item was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Your item was edited successfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.delete
    redirect_to items_path, notice: 'Your item was deleted successfully'
  end
  private

    def item_params
      params.require(:item).permit(:name, :quantity, :price)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
