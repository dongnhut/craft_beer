object @beer
  extends "beers/_attributes"

  glue :category,  object_root: false do
    attributes :name => :category_name
  end