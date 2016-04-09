class CoreAPI < Grape::API
  include APIExtensions

  prefix "api"
  version "v1", using: :path
  format :json
  formatter :json, Grape::Formatter::Rabl

  mount V1::CategoriesAPI
  mount V1::CustomerAPI
  mount V1::AuthAPI

  # Docs
  add_swagger_documentation  mount_path: "/api-docs",
                             api_version: "v1",
                             info: {
                                contact: "vodongnhut@gmail.com",
                                description: %Q(This is the mini project which nhutvd code for test the technology skill),
                                title: "CraftBeer"
                             },
                             markdown: false,
                             hide_documentation_path: true,
                             hide_format: true,
                             include_base_url: true

end
