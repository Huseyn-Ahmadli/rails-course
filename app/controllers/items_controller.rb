class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
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
    redirect_to item_path
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.permit(:price, :name, :real, :height, :weight, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
