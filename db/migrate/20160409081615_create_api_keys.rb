class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token,      null: false
      t.belongs_to :customer, index: true
      t.boolean :active,           null: false, default: true
      t.datetime :expires_at

      t.timestamps null: false
    end
    add_index :api_keys, ["access_token"], name: "index_api_keys_on_access_token", unique: true
        
  end
end
