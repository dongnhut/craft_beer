config = YAML.load_file Rails.root.join('db/data/categories.yml')

ActiveRecord::Base.transaction do
  Category.destroy_all
  config.each do |attr|
      category = Category.create! attr
  end
end