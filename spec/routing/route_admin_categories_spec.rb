require 'rails_helper'

RSpec.describe "routing to admin/categories", :type => :routing do
  
  it "routes /admin/categories to categories#index" do
    expect(:get => "/admin/categories").to route_to(
      :controller => "categories",
      :action => "index"
    )
  end

  it "routes /admin/categories/new to categories#index" do
    expect(:get => "/admin/categories/new").to route_to(
      :controller => "categories",
      :action => "new"
    )
  end

  it "routes /admin/categories to categories#create" do
    expect(:post => "/admin/categories").to route_to(
      :controller => "categories",
      :action => "create"
    )
  end

  it "routes /admin/categories/:id/edit to categories#edit" do
    expect(:get => "/admin/categories/1/edit").to route_to(
      :controller => "categories",
      :action => "edit",
      :id => '1'
    )
  end

  it "routes /admin/categories/:id to categories#show" do
    expect(:get => "/admin/categories/1").to route_to(
      :controller => "categories",
      :action => "show",
      :id => '1'
    )
  end

  it "routes /admin/categories/:id to categories#update" do
    expect(:put => "/admin/categories/1").to route_to(
      :controller => "categories",
      :action => "update",
      :id => '1'
    )
  end

  it "routes /admin/categories/:id to categories#destroy" do
    expect(:delete => "/admin/categories/1").to route_to(
      :controller => "categories",
      :action => "destroy",
      :id => '1'
    )
  end
end