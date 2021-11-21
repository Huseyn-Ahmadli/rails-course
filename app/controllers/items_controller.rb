class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?,    only: %i[edit update new create destroy]
  after_action :show_info,  only: %i[index]

  def index
    @items = Item.all.order(:id)
  end

  def create
    @item = Item.create(items_params)
    if @item.persisted?
      redirect_to items_path
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show; end

  def edit; end

  def update
    @item.update(items_params)
    redirect_to item_path
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50').order(:id)
    render :index
  end


  private

  def items_params
    params.permit(:price, :name, :real, :height, :weight, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def admin?
    true
    # render json: 'Access denied', status: :forbidden unless params[:admin]
  end

  def show_info
    puts 'Index endpoint'
  end
end
