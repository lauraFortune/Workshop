class CartController < ApplicationController
  ######### start of add to cart logic ######### 
   before_action :authenticate_user!
   
  def add
    id = params[:id] #id of product to be added
    
    if session[:cart] then # if cart exist
      cart = session[:cart]
    else # make new cart
      session[:cart] = {}
      cart = session[:cart]
    end
    
    
    if cart[id] then   # If product is in cart
      cart[id] = cart[id] + 1 #then increase the existing quantity by 1
    else
      cart[id] = 1
    end
    
    redirect_to :action => :index
    
  end 
  
    ######## Clear Cart ###############
  def clearCart
    # This sets the cart session to not exist
    session[:cart] = nil
    redirect_to :action => :index
  end 
  
    
  ### Start of remove from cart ########
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index #redirects to action route page
  end
  
  ####### Start increase from cart method ############
  
  def increase
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] then
      cart[id] = cart[id] + 1 
    end
    redirect_to :action => :index
    
  end
  
  
  ####### Start decrease from cart method ############
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] == 1 then
      cart.delete id
    else
    cart[id] = cart[id] - 1
    end
    redirect_to :action => :index
    
  end
  
    ############ Create order #################

  def createOrder
        # 1. find user
        @user = User.find(current_user.id)#create instance var user - User.find looks into user table and get id of current user
      
        # 2. make order to store in database
        @order = @user.orders.build(:order_date => DateTime.now, :status => "Pending") #create instance var order - current users order and datetime 
        @order.save #save order to database
      
        # 3. Take items from current cart  and associate them with the order
        @cart = session[:cart] || {} #var cart = current cart session
      
        @cart.each do |id, quantity|  #for each item in cart -|id and quantity|
        item = Item.find_by_id(id)  # using id find item in items table and declare equal to local var item 
        @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price => item.price)#information comes from item table except for cart which comes from the current cart session
        @orderitem.save
    end
   
        @orders = Order.all  # gives access to all orders
        @orderitems = Orderitem.where(order_id: Order.last)

  end
  

  ############### Start of index logic ####################
  
  def index
    # pass contents of cart to page view
    if session[:cart] then
      @cart = session[:cart] # if session exists - pass cart contents to the cart view
    else 
       @cart = {} # if cart isnt a session then say cart contents is empty
       
    end  
    
  end
end
