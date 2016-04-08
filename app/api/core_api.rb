class CoreAPI < Grape::API
  include APIExtensions

  prefix "api"
  version "v1", using: :path
  format :json
  formatter :json, Grape::Formatter::Rabl

  mount V1::CategoriesAPI
  # mount V1::UserAPI
  # mount V1::AuthAPI

  # Docs
  add_swagger_documentation  mount_path: "/api-docs",
                             api_version: "v1",
                             info: {
                                contact: "vodongnhut@gmail.com",
                                description: %Q(Description area),
                                # license: "Apache 2.0",
                                # license_url: "http://www.apache.org/licenses/LICENSE-2.0.html",
                                # terms_of_service_url: "http://helloreverb.com/terms/",
                                title: "CraftBeer"
                             },
                             markdown: GrapeSwagger::Markdown::KramdownAdapter,
                             hide_documentation_path: true,
                             hide_format: true,
                             include_base_url: true

end
