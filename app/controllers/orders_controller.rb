class OrdersController < ApplicationController
  

  def index
    #@orders = Order.all
  end

  def search
    @container = params[:container_planned]

    ## until switch to production where 'CES' values exist
    #criteria = "container_planned = ? AND revenue_code_id = 'CES' AND status = 'P'"
    criteria = "container_planned = ? AND revenue_code_id = 'CES' OR status = 'P'"

  
    @order = Order.find_by(criteria, params[:container_planned])
  end
end
