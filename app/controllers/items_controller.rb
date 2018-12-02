class ItemsController < ApplicationController
    def index
    end

    def my_index
    end

    def show
        @item = Item.find(params[:id])
        @user = User.find(@item.user_id)
    end

    def new
        @item = Item.new()
    end

    def create
        @item = Item.new(item_params)
        @item.update(user_id:current_user.id)
        @item.save
        redirect_to user_path(current_user.id)
    end

    def my_items
        @user = User.find(params[:id])
        @my_items = @user.items
        respond_to do |format|
            format.html {}
            format.js
        end
    end

    def search_all_items
        @items = Item.all
        @search_items = Item.search_items(params["searchitem"])
        # byebug
        @item = Item.find_by(name: params["searchitem"])

        respond_to do |format|
            format.html { redirect_to item_path(@item.id) }
            format.json { render json: @search_items.map{|i| i.name}}
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :used, :category)
    end
end
