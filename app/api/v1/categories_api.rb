module V1
  class CategoriesAPI < Grape::API
    resource :categories do

      # listing categories
      get "/", rabl: "categories/index" do
        @categories = Category.all
      end

    end
  end
end