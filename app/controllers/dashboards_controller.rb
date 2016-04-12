class DashboardsController < ApplicationController
  def index
    @members = User.count
    @customers = Customer.count
    @categories = Category.count
    @beers = Beer.count
  end
end
