class UsersController < ApplicationController
  def index
    puts "====="*8
    puts params[:page]
    if params.has_key?("page")
      page = params.fetch("page")
      @users = User.page(page)
    else
      @users = User.page(nil)
    end
  end

  def show
    @user = User.find(params.fetch("id"))
  end
end
