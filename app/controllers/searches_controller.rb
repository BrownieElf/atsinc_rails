class SearchesController < ApplicationController
  #before_filter :check_for_valid_container_number


  def index
  end

  def search

    @container = params[:container_planned].to_s\

    unless @container.match(/^[a-zA-Z]{4}\d{7}$/)
      #flash[:alert] = "Invalid container number entered!"
      render 'searches/index'
      flash[:alert] = "Invalid container number entered!"

    end


    ## SELECT
      #fields = 'id, revenue_code_id, status, ordered_date, temperature_min'
    fields = 'id, revenue_code_id, status, ordered_date, preloaded'
    ## where                                               
    criteria = "container_planned = ? AND (revenue_code_id = 'CES' AND status = 'P')"
    
    @search = Order.select(fields).find_by(criteria, @container)
  
  end




  # private

  # def check_for_valid_container_number
  #   unless @container.match(/^[a-zA-Z]{4}\d{7}$/)
  #     flash[:alert] = "Invalid container number entered!"
  #     redirect_to 'searches/index'
  #   end
  # end

end

