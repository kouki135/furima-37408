class ItemsController < ApplicationController
  before_action :basic_auth

  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
