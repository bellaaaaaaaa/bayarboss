class BraintreeController < ApplicationController
  def new
    # byebug
    @item = Item.find(params[:format])
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    @item = Item.find(params[:id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    
    result = Braintree::Transaction.sale(
      :amount => @item.highprice, #this is currently hardcoded
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
      )
      
      byebug
    if result.success?
      @item.update(status:'closed')
      @review = Review.new(review_for: @item.user.id, user_id:current_user.id, review_item:@item.id)
      @review.save
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
