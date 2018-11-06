class UsersController < ApplicationController
  def index

    @users = User.page(params.fetch("page", nil))
    render("users_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id"))
    render("users_templates/show.html.erb")
  end
end
