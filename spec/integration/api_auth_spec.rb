require 'airborne'
require 'active_support'


describe 'api customer spec' do
  before do 
    @auth_login_path = '/auth/login'
    @auth_logout_path = '/auth/logout'
  end

  it 'should validate types' do
    post @auth_login_path, { 
        email: 'customer1@gmail.com',
        password: '12345678'
      }
    expect_json_types(meta: {status: :string, code: :integer})
    expect_json_types(data: {id: :integer, name: :string, email: :string, address: :string, access_token: :string})
  end

  it "should login success" do
    post @auth_login_path, { 
        email: 'customer1@gmail.com',
        password: '12345678',
      }
    expect_json(meta: {status: "success", code: 200})
  end

  it "should login failed" do
    post @auth_login_path, { 
        email: 'not_customer@gmail.com',
        password: '12345678',
      }
    expect_json(meta: {status: "failed", code: 404})
  end

  it "should login failed" do
    post @auth_login_path, { 
        email: 'customer1@gmail.com',
        password: '000000',
      }
    expect_json(meta: {status: "failed", code: 401})
  end

  it "should login failed" do
    post @auth_login_path, {}
    expect_json(meta: {status: "failed", code: 500})
  end

end
