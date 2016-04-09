module V1
  class CategoriesAPI < Grape::API
    # Include Grape::Kaminari module in your api
    include Grape::Kaminari

    resource :categories do
      paginate per_page: 10, offset: false

      desc "listing categories"
      get "/", rabl: "categories/index" do
        @categories = Category.page(params[:page]).per(params[:per_page])
      end

    end
  end
end