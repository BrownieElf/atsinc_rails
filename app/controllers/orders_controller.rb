class OrdersController < ApplicationController
  

  def index
    #@orders = Order.all
  end

  def search
    @container = params[:container_planned].to_s\

    if @container.match(/^[a-zA-Z]{4}\d{7}$/)
      ## SELECT
      fields = 'id, revenue_code_id, status, ordered_date, preloaded'
      ## WHERE                                               
      criteria = "container_planned = ? AND (revenue_code_id = 'CES' AND status = 'P')"
      @search = Order.select(fields).find_by(criteria, @container)
    else
      flash[:notice] = "Please enter a valid container number"
      redirect_to root_path
    end
  end
end


## old search

 # @container = params[:container_planned].to_s\


 #    #if @container == nil
    

 #    ## SELECT
 #      fields = 'id, revenue_code_id, status, ordered_date, temperature_min'
 #    ## where                                               
 #      criteria = "container_planned = ? AND (revenue_code_id = 'CES' AND status = 'P')"
    
 #      @order = Order.select(fields).find_by(criteria, @container)
 #  