class ItemsController < ApplicationController
  before_action :dep_find
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = @dep.items
  end
  
  def show
  end

  def new
    @item = @dep.items.new
    render partial: "form"
  end

  def create
    @item = @dep.items.new(item_params)
    if @item.save
      redirect_to department_items_path(@dep)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to department_items_path(@dep)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to department_items_path(@dep)
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :brand, :value)
    end

    def dep_find
      @dep = Department.find(params[:department_id])
    end

    def item_find
      @item = Item.find(params[:id])
    end


end
