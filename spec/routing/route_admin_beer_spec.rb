require 'rails_helper'

RSpec.describe "routing to admin/beers", :type => :routing do
  
  it "routes /admin/beers to beers#index" do
    expect(:get => "/admin/beers").to route_to(
      :controller => "beers",
      :action => "index"
    )
  end

  it "routes /admin/beers/new to beers#index" do
    expect(:get => "/admin/beers/new").to route_to(
      :controller => "beers",
      :action => "new"
    )
  end

  it "routes /admin/beers to beers#create" do
    expect(:post => "/admin/beers").to route_to(
      :controller => "beers",
      :action => "create"
    )
  end

  it "routes /admin/beers/:id/edit to beers#edit" do
    expect(:get => "/admin/beers/1/edit").to route_to(
      :controller => "beers",
      :action => "edit",
      :id => '1'
    )
  end

  it "routes /admin/beers/:id to beers#show" do
    expect(:get => "/admin/beers/1").to route_to(
      :controller => "beers",
      :action => "show",
      :id => '1'
    )
  end

  it "routes /admin/beers/:id to beers#update" do
    expect(:put => "/admin/beers/1").to route_to(
      :controller => "beers",
      :action => "update",
      :id => '1'
    )
  end

  it "routes /admin/beers/:id/archive to beers#archive" do
    expect(:put => "/admin/beers/1/archive").to route_to(
      :controller => "beers",
      :action => "archive",
      :id => '1'
    )
  end

  it "routes /admin/beers/:id/unarchive to beers#unarchive" do
    expect(:put => "/admin/beers/1/unarchive").to route_to(
      :controller => "beers",
      :action => "unarchive",
      :id => '1'
    )
  end

  it "routes /admin/beers/:id to beers#destroy" do
    expect(:delete => "/admin/beers/1").to route_to(
      :controller => "beers",
      :action => "destroy",
      :id => '1'
    )
  end
end