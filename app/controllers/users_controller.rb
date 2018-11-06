class UsersController < ApplicationController
  def index

    if params.has_key?("page")
      page = params.fetch("page")
      @users = User.page(page)
    else
      @users = User.page(nil)
    end
    render("users_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id"))
    render("users_templates/show.html.erb")
  end
end
