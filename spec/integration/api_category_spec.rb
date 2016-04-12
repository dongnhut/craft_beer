require 'airborne'
require 'active_support'


describe 'api customer spec' do
  before do 
    @get_categories_path = '/categories'
  end

  it 'should validate types' do
    get @get_categories_path, params: {page: 1, per_page: 10}
    expect_json_types(meta: {status: :string, code: :integer})
    expect_json_types('data.categories.*', {
      id: :integer,
      name: :string,
      description: :string,
      beers: :array_of_objects
      })
  end
end