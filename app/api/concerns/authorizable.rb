module Authorizable 
  extend ActiveSupport::Concern
  included do
    helpers do
      def authenticate!
        fail Unauthorized unless current_user
      end

      def current_user
        # find token. Check if valid.
        token = ApiKey.find_by(access_token: headers['Access-Token'])
        unless token && !token.expired?
          false
        else
          @customer = Customer.find(token.customer_id)
        end
      end
    end
  end
end