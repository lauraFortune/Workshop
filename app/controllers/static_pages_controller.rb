class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def about
 
  end
  
  def paid
    #@order = Order.find_by(id: params[:id])
    #@order.update_attribute(:status, "Paid by User: #{current_user.email}")
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "Paid with Paypal")
    
    session.delete(:cart) # empty the session cart after payment complete
  end
  
  def category
    @categories = Category.all
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  def account
    @user = User.find(current_user.id) #find a logged in user
    @orders = @user.orders.all #create orders for that user
    @items = Item.all
    
  end
  
 
end
