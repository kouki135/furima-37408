class ItemsController < ApplicationController


  def index
    
  end

  def new
    authenticate_user!
    @tweet = Item.new
  end


end
