class ItemsController < ApplicationController
    def index
    end

    def my_index
    end

    def show
        @item = Item.find(params[:id])
        @item_bids = Item.find(params[:id]).bids.order("created_at DESC")
        @user = User.find(@item.user_id)
        @highest_bid = Bid.order("amount DESC").first
    end

    def new
        @item = Item.new()
    end

    def create
        @item = Item.new(item_params)
        @item.update(user_id:current_user.id)
        if @item.save
            redirect_to edit_item_path(@item.id)
        else
            redirect_to user_path(current_user.id)
        end
    end

    def edit 
        @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to @item
    end

    def my_items
        @user = User.find(params[:id])
        @my_items = @user.items
        respond_to do |format|
            format.html {}
            format.js
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to user_path(current_user.id)
    end

    def search_all_items
        @items = Item.all
        @search_items = Item.search_items(params["searchitem"])
        @item = Item.find_by(name: params["searchitem"])

        respond_to do |format|
            format.html { redirect_to item_path(@item.id) }
            format.json { render json: @search_items.map{|i| i.name}}
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :used, :category, :place, :latitude, :longitude, :image, :condition, :highprice)
    end
end
