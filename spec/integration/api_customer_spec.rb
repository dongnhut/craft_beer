require 'airborne'
require 'active_support'
require 'ffaker'


describe 'api customer spec' do
  before do 
    @register_customer_path = '/customers/register'
  end

  it 'should validate types' do
    post @register_customer_path, { 
        email: FFaker::Internet.email,
        password: '12345678',
        name: FFaker::Name.name ,
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json_types(meta: {status: :string, code: :integer})
    expect_json_types(data: {id: :integer, name: :string, email: :string, address: :string})
  end

  it "should registry success" do
    post @register_customer_path, { 
        email: FFaker::Internet.email,
        password: '12345678',
        name: FFaker::Name.name ,
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json(meta: {status: "success", code: 200})
  end

  it "should registry failed" do
    post @register_customer_path, { 
        email: 'customer78',
        password: '12345678',
        name: FFaker::Name.name ,
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json(meta: {status: "failed", code: 400})
  end

  it "should registry failed" do
    post @register_customer_path, { 
        email: nil,
        password: '12345678',
        name: FFaker::Name.name ,
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json(meta: {status: "failed", code: 400})
  end

  it "should registry failed" do
    post @register_customer_path, { 
        email: FFaker::Internet.email,
        name: FFaker::Name.name ,
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json(meta: {status: "failed", code: 500})
  end

  it "should registry failed" do
    post @register_customer_path, { 
        email: FFaker::Internet.email,
        password: '12345678',
        address: FFaker::Address.street_address + FFaker::Address.city
      }
    expect_json(meta: {status: "failed", code: 500})
  end

  it "should registry failed" do
    post @register_customer_path, { 
        email: FFaker::Internet.email,
        password: '12345678',
        name: FFaker::Name.name
      }
    expect_json(meta: {status: "failed", code: 500})
  end


end
