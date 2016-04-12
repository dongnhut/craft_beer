require 'rails_helper'

RSpec.describe "routing to admin", :type => :routing do
  
  it "routes /admin to dashboards#index for root" do
    expect(:get => "/admin").to route_to(
      :controller => "dashboards",
      :action => "index"
    )
  end

  it "does not expose a list of profiles" do
    expect(:get => "/profiles").not_to be_routable
  end


end