require 'rails_helper'

RSpec.describe "routing to admin/users", :type => :routing do
  
  it "routes /admin/users to users#index" do
    expect(:get => "/admin/users").to route_to(
      :controller => "users",
      :action => "index"
    )
  end

  it "routes /admin/users/new to users#index" do
    expect(:get => "/admin/users/new").to route_to(
      :controller => "users",
      :action => "new"
    )
  end

  it "routes /admin/users to users#create" do
    expect(:post => "/admin/users").to route_to(
      :controller => "users",
      :action => "create"
    )
  end

  it "routes /admin/users/:id/edit to users#edit" do
    expect(:get => "/admin/users/1/edit").to route_to(
      :controller => "users",
      :action => "edit",
      :id => '1'
    )
  end

  it "routes /admin/users/:id to users#show" do
    expect(:get => "/admin/users/1").to route_to(
      :controller => "users",
      :action => "show",
      :id => '1'
    )
  end

  it "routes /admin/users/:id to users#update" do
    expect(:put => "/admin/users/1").to route_to(
      :controller => "users",
      :action => "update",
      :id => '1'
    )
  end

  it "routes /admin/users/:id to users#destroy" do
    expect(:delete => "/admin/users/1").to route_to(
      :controller => "users",
      :action => "destroy",
      :id => '1'
    )
  end

  it "routes /admin/users/sign_in to users/sessions#new" do
    expect(:get => "/admin/users/sign_in").to route_to(
      :controller => "users/sessions",
      :action => "new"
    )
  end

  it "routes /admin/users/sign_in to users/sessions#create" do
    expect(:post => "/admin/users/sign_in").to route_to(
      :controller => "users/sessions",
      :action => "create"
    )
  end

  it "routes /admin/users/sign_out to users/sessions#destroy" do
    expect(:delete => "/admin/users/sign_out").to route_to(
      :controller => "users/sessions",
      :action => "destroy"
    )
  end


end