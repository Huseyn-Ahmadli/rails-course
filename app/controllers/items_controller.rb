class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      render json: item.name, status: :created
    else
      render json: item.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    render body: 'User not exist', status: 404 unless (@item = Item.where(id: params[:id]).first)
  end

  def update
    Item.where(id: params[:id]).update(items_params)
    redirect_to item_path
  end

  def destroy
    item = Item.where(id: params[:id]).first.destroy
    if item.destroyed?
      redirect_to items_path
    else
      render json: item.errors.full_messages, status: :unprocessable_entity
    end

  end

  private

  def items_params
    params.permit(:price, :name, :real, :height, :weight, :description)
  end

end
