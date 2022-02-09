class ItemsController < ApplicationController
before_action :authenticate_user!, onry: [:new]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    
  end


end
