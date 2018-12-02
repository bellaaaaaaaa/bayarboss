class BidsController < ApplicationController
    def create 
        @item = Item.find(params[:id])
        @bid = Bid.new(bid_params)
        @bid.update(user_id: current_user.id)
        @bid.update(item_id: @item.id)
        @bid.save
        
        redirect_to @item
        flash[:notice] = "Successfuly placed your bid!"
    end

    private

    def bid_params
        params.require(:bid).permit(:amount)
    end
end
