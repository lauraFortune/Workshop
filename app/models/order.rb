class Order < ApplicationRecord
    
  def oder_params
  # strong paramaters - when user makes an order - permit the inclusion of the following parameters. If we don't do this the order won't save. Order records from table are added here. 
  params.require(:order).permit(:order_date, :user_id, :status)
  end
    
  has_many :orderitems    
  belongs_to :user
end

