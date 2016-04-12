module V1
  class BeersAPI < Grape::API
    # Include Grape::Kaminari module in your api
    include Grape::Kaminari

    resource :beers do
      paginate per_page: 10, offset: false

      desc "listing beers"
      params do
        requires :category_id, type: Integer
      end
      get "/", rabl: "beers/index" do
        @beers = Beer.beers_of_category(params[:category_id]).page(params[:page]).per(params[:per_page])
        fail ResourceNotFound unless @beers.present?
        @beers
      end

    end
  end
end