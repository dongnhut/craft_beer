object @category
  extends "categories/_attributes"

  child :beers, :object_root => false do
    extends "beers/_attributes"
  end