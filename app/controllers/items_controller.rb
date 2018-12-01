class ItemsController < ApplicationController
    def index
    end

    def my_index
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

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :used, :category)
    end
end
