Rails.application.routes.draw do
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'

  
  resources :orders do
    resources :orderitems # when create an order will allow us to push the order items into the order and store 
  end

  devise_for :users do
    resources:orders # nesting resources like above so user has access 
  end
 
  get '/checkout' => 'cart#createOrder'
 
  post '/search' => 'items#search'
    
  get 'cart/index'
  resources :items
  root 'static_pages#home'

  
  get '/about' => 'static_pages#about' 
  get '/account' => 'static_pages#account'
  
  resources :categories
  get 'category/:title', to: 'static_pages#category'
  
  
  get '/cart/clear' => 'cart#clearCart'
  
  get '/cart/:id' => 'cart#add'#when user clicks add to cart button -get cart item id(created by rails) and go to cart controller use add method
  
  get '/cart/remove/:id' => 'cart#remove'
  
 
  get '/paid/:id' => 'static_pages#paid'
  
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart' => 'cart#index'

  #get 'static_pages/home'

  #get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
