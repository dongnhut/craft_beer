object @category
  extends "categories/_attributes"

  child :unarchived_beers, :object_root => false do
    extends "beers/_attributes"
  end
