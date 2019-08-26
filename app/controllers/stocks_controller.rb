class StocksController < ApplicationController

  def search
    if !params[:stock]
      flash.now[:danger] = "You have entered an empty string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      #@stock.save
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end


end