class Api::ItemsController < ApiController
  before_action :authenticate_user
  
  def index
    render json: items, each_serializer: ItemSerializer
  end
 
  def create
    item = Item.new(item_params)
    list = List.find(params[:list_id])
    item.list = list
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    item = current_user.lists.items.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:description, :complete)
  end
end