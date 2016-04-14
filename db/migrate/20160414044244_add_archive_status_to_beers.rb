class AddArchiveStatusToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :archive_status, :integer, default: 0
  end
end
