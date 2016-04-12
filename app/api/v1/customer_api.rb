module V1
  class CustomerAPI < Grape::API
    resource :customers do

      desc "Register customers."
      params do
        # requires :action, type: Symbol, values: [:PAUSE, :RESUME, :STOP], documentation: { param_type: 'query' }
        requires :email, type: String
        requires :password, type: String
        requires :name, type: String
        requires :address, type: String
      end
      post "/register", rabl: "customers/show" do
        ActiveRecord::Base.transaction do
          @customer = Customer.register(converted_params)
        end
      end

      desc "show current customer.",{
        headers: {
          "Access-Token" => { description: "Access-Token", required: true }
        }
      }
      get "/", rabl: "customers/show" do
        ActiveRecord::Base.transaction do
          authenticate!
        end
      end

    end
  end
end